import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/app/domain/entities/pokemon_list_entity/pokemon_list_item_entity.dart';

import '../../../core/network/network_info.dart';
import '../../../domain/usecase/get_list_pokemon_usecase.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController({
    required this.getListPokemonUsecase,
    required this.networkInfo,
  });

  final GetListPokemonUsecase getListPokemonUsecase;
  final NetworkInfo networkInfo;

  final ScrollController scrollController = ScrollController();
  StreamSubscription<bool>? _connectivitySubscription;

  final RxList<PokemonListItemEntity> pokemonList =
      <PokemonListItemEntity>[].obs;
  final RxList<PokemonListItemEntity> filteredPokemonList =
      <PokemonListItemEntity>[].obs;

  final RxBool isLoading = false.obs;
  final RxBool isLoadMore = false.obs;
  final RxBool isError = false.obs;
  final RxBool isEmpty = false.obs;
  final RxBool hasMore = true.obs;
  final RxBool isConnected = true.obs;

  final RxString errorMessage = ''.obs;
  final RxString searchQuery = ''.obs;

  final int limit = 20;
  int offset = 0;

  final colors = [
    const Color.fromARGB(255, 255, 222, 221),
    const Color(0xFFA98FF3),
    const Color(0xFFEAE2EA),
    const Color.fromARGB(255, 245, 255, 171),
    const Color(0xFFA98FF3),
    const Color.fromARGB(255, 245, 255, 171),
    const Color(0xFFA98FF3),
    const Color.fromARGB(255, 255, 222, 221),
    const Color(0xFFA98FF3),
    const Color(0xFFEAE2EA),
  ];

  @override
  void onInit() {
    super.onInit();
    _setupScrollListener();
    _listenConnection();

    fetchInitialPokemon();
  }

  void _setupScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          !isLoading.value &&
          !isLoadMore.value &&
          hasMore.value) {
        fetchMorePokemon();
      }
    });
  }

  Future<void> _listenConnection() async {
    isConnected.value = await networkInfo.isConnected;

    _connectivitySubscription = networkInfo.onConnectivityChanged.listen((
      connected,
    ) {
      final previousValue = isConnected.value;
      isConnected.value = connected;

      if (previousValue != connected) {
        if (!connected) {
          Get.snackbar(
            'Offline mode',
            'Koneksi internet terputus. Data akan diambil dari cache jika tersedia.',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
          );
        } else {
          Get.snackbar(
            'Online',
            'Koneksi internet kembali tersedia.',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2),
          );
        }
      }
    });
  }

  Future<void> fetchInitialPokemon() async {
    isLoading.value = true;
    isError.value = false;
    isEmpty.value = false;
    errorMessage.value = '';
    hasMore.value = true;
    offset = 0;

    pokemonList.clear();
    filteredPokemonList.clear();

    final result = await getListPokemonUsecase(offset: offset, limit: limit);

    if (result.isSuccess) {
      final data = result.data ?? [];

      pokemonList.assignAll(data);
      _applySearch(searchQuery.value);

      isEmpty.value = data.isEmpty;

      // Saat offline, cache kamu belum per-page.
      // Jadi aman untuk menganggap tidak ada load more offline.
      hasMore.value = isConnected.value ? data.length >= limit : false;

      offset += data.length;

      if (!isConnected.value && data.isNotEmpty) {
        Get.snackbar(
          'Menampilkan cache',
          'Data ditampilkan dari penyimpanan lokal.',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
        );
      }
    } else {
      isError.value = true;
      errorMessage.value = result.failure?.message ?? 'Unknown error';
    }

    isLoading.value = false;
  }

  Future<void> fetchMorePokemon() async {
    if (!hasMore.value || isLoadMore.value) return;

    // Dengan cache satu key global, load more offline sebaiknya diblok
    if (!isConnected.value) {
      hasMore.value = false;

      Get.snackbar(
        'Offline',
        'Load more tidak tersedia saat offline.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
      return;
    }

    isLoadMore.value = true;

    final result = await getListPokemonUsecase(offset: offset, limit: limit);

    if (result.isSuccess) {
      final data = result.data ?? [];

      if (data.isEmpty) {
        hasMore.value = false;
      } else {
        pokemonList.addAll(data);
        _applySearch(searchQuery.value);
        offset += data.length;

        if (data.length < limit) {
          hasMore.value = false;
        }
      }
    } else {
      errorMessage.value = result.failure?.message ?? 'Unknown error';

      Get.snackbar(
        'Gagal memuat data',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }

    isLoadMore.value = false;
  }

  void onSearchChanged(String value) {
    searchQuery.value = value;
    _applySearch(value);
  }

  void _applySearch(String query) {
    if (query.trim().isEmpty) {
      filteredPokemonList.assignAll(pokemonList);
      isEmpty.value = pokemonList.isEmpty;
      return;
    }

    final keyword = query.toLowerCase().trim();

    final results = pokemonList.where((pokemon) {
      return pokemon.name.toLowerCase().contains(keyword);
    }).toList();

    filteredPokemonList.assignAll(results);
    isEmpty.value = results.isEmpty;
  }

  Future<void> onRefresh() async {
    await fetchInitialPokemon();
  }

  @override
  void onClose() {
    _connectivitySubscription?.cancel();
    scrollController.dispose();
    super.onClose();
  }
}
