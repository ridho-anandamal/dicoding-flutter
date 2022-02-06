import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/tv/last_episode_to_air_model.dart';
import 'package:ditonton/data/models/tv/network_model.dart';
import 'package:ditonton/data/models/tv/production_country_model.dart';
import 'package:ditonton/data/models/tv/season_model.dart';
import 'package:ditonton/data/models/tv/spoken_language_model.dart';
import 'package:ditonton/data/models/tv/tv_detail_model.dart';
import 'package:ditonton/data/models/tv/tv_model.dart';
import 'package:ditonton/data/repositories/tv_repository_impl.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/tv_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TVRepositoryImpl repository;
  late MockTVRemoteDataSource mockTVRemoteDataSource;
  late MockTVLocalDataSource mockTVLocalDataSource;

  setUp(() {
    mockTVRemoteDataSource = MockTVRemoteDataSource();
    mockTVLocalDataSource = MockTVLocalDataSource();
    repository = TVRepositoryImpl(
      localDataSource: mockTVLocalDataSource,
      remoteDataSource: mockTVRemoteDataSource,
    );
  });

  final tTVModel = TVModel(
    adult: false,
    backdropPath: "/qJYUCO1Q8desX7iVDkwxWVnwacZ.jpg",
    firstAirDate: DateTime.parse("2010-09-17"),
    genreIds: [10759, 16],
    id: 32315,
    name: "Sym-Bionic Titan",
    originCountry: ["US"],
    originalLanguage: "en",
    originalName: "Sym-Bionic Titan",
    overview:
        "Sym-Bionic Titan is an American animated action science fiction television series created by Genndy Tartakovsky, Paul Rudish, and Bryan Andrews for Cartoon Network. The series focuses on a trio made up of the alien princess Ilana, the rebellious soldier Lance, and the robot Octus; the three are able to combine to create the titular Sym-Bionic Titan. A preview of the series was first shown at the 2009 San Diego Comic-Con International, and further details were revealed at Cartoon Network's 2010 Upfront. The series premiered on September 17, 2010, and ended on April 9, 2011. The series is rated TV-PG-V. Cartoon Network initially ordered 20 episodes; Tartakovsky had hoped to expand on that, but the series was not renewed for another season, as the show 'did not have any toys connected to it.' Although Sym-Bionic Titan has never been released on DVD, All 20 episodes are available on iTunes. On October 7, 2012, reruns of Sym-Bionic Titan began airing on Adult Swim's Toonami block.",
    popularity: 9.693,
    posterPath: "/3UdrghLghvYnsVohWM160RHKPYQ.jpg",
    voteAverage: 8.8,
    voteCount: 85,
  );

  final tTV = TV(
    backdropPath: "/qJYUCO1Q8desX7iVDkwxWVnwacZ.jpg",
    firstAirDate: DateTime.parse("2010-09-17"),
    genreIds: [10759, 16],
    id: 32315,
    name: "Sym-Bionic Titan",
    originCountry: ["US"],
    originalLanguage: "en",
    originalName: "Sym-Bionic Titan",
    overview:
        "Sym-Bionic Titan is an American animated action science fiction television series created by Genndy Tartakovsky, Paul Rudish, and Bryan Andrews for Cartoon Network. The series focuses on a trio made up of the alien princess Ilana, the rebellious soldier Lance, and the robot Octus; the three are able to combine to create the titular Sym-Bionic Titan. A preview of the series was first shown at the 2009 San Diego Comic-Con International, and further details were revealed at Cartoon Network's 2010 Upfront. The series premiered on September 17, 2010, and ended on April 9, 2011. The series is rated TV-PG-V. Cartoon Network initially ordered 20 episodes; Tartakovsky had hoped to expand on that, but the series was not renewed for another season, as the show 'did not have any toys connected to it.' Although Sym-Bionic Titan has never been released on DVD, All 20 episodes are available on iTunes. On October 7, 2012, reruns of Sym-Bionic Titan began airing on Adult Swim's Toonami block.",
    popularity: 9.693,
    posterPath: "/3UdrghLghvYnsVohWM160RHKPYQ.jpg",
    voteAverage: 8.8,
    voteCount: 85,
  );

  final tTVModelList = <TVModel>[tTVModel];
  final tTVList = <TV>[tTV];

  group('On The Air TV Shows', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getOnTheAirTVShows())
          .thenAnswer((_) async => tTVModelList);
      // act
      final result = await repository.getOnTheAirTVShows();
      // assert
      verify(mockTVRemoteDataSource.getOnTheAirTVShows());
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTVList);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getOnTheAirTVShows())
          .thenThrow(ServerException());
      // act
      final result = await repository.getOnTheAirTVShows();
      // assert
      verify(mockTVRemoteDataSource.getOnTheAirTVShows());
      expect(result, equals(Left(ServerFailure('Error Server'))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getOnTheAirTVShows())
          .thenThrow(SocketException('Failed to connect to he network'));
      // act
      final result = await repository.getOnTheAirTVShows();
      // assert
      verify(mockTVRemoteDataSource.getOnTheAirTVShows());
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Popular TV Shows', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getPopularTVShows())
          .thenAnswer((_) async => tTVModelList);
      // act
      final result = await repository.getPopularTVShows();
      // assert
      verify(mockTVRemoteDataSource.getPopularTVShows());
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTVList);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getPopularTVShows())
          .thenThrow(ServerException());
      // act
      final result = await repository.getPopularTVShows();
      // assert
      verify(mockTVRemoteDataSource.getPopularTVShows());
      expect(result, equals(Left(ServerFailure('Error Server'))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getPopularTVShows())
          .thenThrow(SocketException('Failed to connect to he network'));
      // act
      final result = await repository.getPopularTVShows();
      // assert
      verify(mockTVRemoteDataSource.getPopularTVShows());
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Top Rated TV Shows', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTopRatedTVShows())
          .thenAnswer((_) async => tTVModelList);
      // act
      final result = await repository.getTopRatedTVShows();
      // assert
      verify(mockTVRemoteDataSource.getTopRatedTVShows());
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTVList);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTopRatedTVShows())
          .thenThrow(ServerException());
      // act
      final result = await repository.getTopRatedTVShows();
      // assert
      verify(mockTVRemoteDataSource.getTopRatedTVShows());
      expect(result, equals(Left(ServerFailure('Error Server'))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTopRatedTVShows())
          .thenThrow(SocketException('Failed to connect to he network'));
      // act
      final result = await repository.getTopRatedTVShows();
      // assert
      verify(mockTVRemoteDataSource.getTopRatedTVShows());
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Get TV Detail', () {
    final tId = 1;
    final tTVResponse = TVDetailResponse(
        backdropPath: "/path.jpg",
        createdBy: [],
        episodeRunTime: [1, 2, 3, 4],
        firstAirDate: DateTime.parse("2021-12-15"),
        genres: [GenreModel(id: 1, name: "Action")],
        homepage: "https://google.com",
        id: 1,
        inProduction: true,
        languages: ["en"],
        lastAirDate: DateTime.parse("2021-09-03"),
        lastEpisodeToAir: LastEpisodeToAirModel(
            airDate: DateTime.parse("2021-09-03"),
            episodeNumber: 1,
            id: 1,
            name: "Episode Name",
            overview: "Episode Overview",
            productionCode: "",
            seasonNumber: 1,
            stillPath: "/path.jpg",
            voteAverage: 1.0,
            voteCount: 1),
        name: "Name",
        nextEpisodeToAir: null,
        networks: [
          NetworkModel(
              name: "Network",
              id: 1,
              logoPath: "/path.png",
              originCountry: "US")
        ],
        numberOfEpisodes: 1,
        numberOfSeasons: 1,
        originCountry: ["US"],
        originalLanguage: "en",
        originalName: "Original Name",
        overview: "Overview",
        popularity: 1.0,
        posterPath: "/path.jpg",
        productionCompanies: [
          {
            "id": 1,
            "logo_path": "/path.png",
            "name": "Overview Company",
            "origin_country": "US"
          },
          {
            "id": 1,
            "logo_path": null,
            "name": "Company",
            "origin_country": "US"
          }
        ],
        productionCountries: [
          ProductionCountryModel(
            iso31661: "US",
            name: "United States of America",
          )
        ],
        seasons: [
          SeasonModel(
            airDate: DateTime.parse("2021-09-03"),
            episodeCount: 1,
            id: 1,
            name: "Season 1",
            overview: "",
            posterPath: "/path.jpg",
            seasonNumber: 1,
          )
        ],
        spokenLanguages: [
          SpokenLanguageModel(
            englishName: "English",
            iso6391: "en",
            name: "English",
          )
        ],
        status: "Status",
        tagline: "Tagline",
        type: "Action",
        voteAverage: 1.0,
        voteCount: 1);

    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTVShowDetail(tId))
          .thenAnswer((_) async => tTVResponse);
      // act
      final result = await repository.getTVShowDetail(tId);
      // assert
      verify(mockTVRemoteDataSource.getTVShowDetail(tId));
      expect(result, equals(Right(testTVShowDetail)));
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTopRatedTVShows())
          .thenThrow(ServerException());
      // act
      final result = await repository.getTopRatedTVShows();
      // assert
      verify(mockTVRemoteDataSource.getTopRatedTVShows());
      expect(result, equals(Left(ServerFailure('Error Server'))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTopRatedTVShows())
          .thenThrow(SocketException('Failed to connect to he network'));
      // act
      final result = await repository.getTopRatedTVShows();
      // assert
      verify(mockTVRemoteDataSource.getTopRatedTVShows());
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Get TV Shows Recomendations', () {
    final tTVList = <TVModel>[];
    final tId = 1;

    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTVShowsRecomendation(tId))
          .thenAnswer((_) async => tTVList);
      // act
      final result = await repository.getTVShowsRecommendation(tId);
      // assert
      verify(mockTVRemoteDataSource.getTVShowsRecomendation(tId));
      final resultList = result.getOrElse(() => []);
      expect(resultList, equals(tTVList));
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTVShowsRecomendation(tId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getTVShowsRecommendation(tId);
      // assert
      verify(mockTVRemoteDataSource.getTVShowsRecomendation(tId));
      expect(result, equals(Left(ServerFailure('Error Server'))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTVShowsRecomendation(tId))
          .thenThrow(SocketException('Failed to connect to he network'));
      // act
      final result = await repository.getTVShowsRecommendation(tId);
      // assert
      verify(mockTVRemoteDataSource.getTVShowsRecomendation(tId));
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Search TV Shows', () {
    final tQuery = 'titan';

    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.searchTVShows(tQuery))
          .thenAnswer((_) async => tTVModelList);
      // act
      final result = await repository.searchTVShows(tQuery);
      // assert
      verify(mockTVRemoteDataSource.searchTVShows(tQuery));
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTVList);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.searchTVShows(tQuery))
          .thenThrow(ServerException());
      // act
      final result = await repository.searchTVShows(tQuery);
      // assert
      expect(result, Left(ServerFailure('Error Server')));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockTVRemoteDataSource.searchTVShows(tQuery))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.searchTVShows(tQuery);
      // assert
      expect(
          result, equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('save watchlist', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockTVLocalDataSource.insertWatchlist(testTVTable))
          .thenAnswer((_) async => 'Added to Watchlist');
      // act
      final result = await repository.saveWatchlistTV(testTVShowDetail);
      // assert
      expect(result, Right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockTVLocalDataSource.insertWatchlist(testTVTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await repository.saveWatchlistTV(testTVShowDetail);
      // assert
      expect(result, Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove successful', () async {
      // arrange
      when(mockTVLocalDataSource.removeWatchlist(testTVTable))
          .thenAnswer((_) async => 'Removed from watchlist');
      // act
      final result = await repository.removeWatchlistTV(testTVShowDetail);
      // assert
      expect(result, Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(mockTVLocalDataSource.removeWatchlist(testTVTable))
          .thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result = await repository.removeWatchlistTV(testTVShowDetail);
      // assert
      expect(result, Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether data is found', () async {
      // arrange
      final tId = 1;
      when(mockTVLocalDataSource.getTVById(tId)).thenAnswer((_) async => null);
      // act
      final result = await repository.isAddedToWatchlistTV(tId);
      // assert
      expect(result, false);
    });
  });

  group('get watchlist movies', () {
    test('should return list of Movies', () async {
      // arrange
      when(mockTVLocalDataSource.getWatchlistTVShows())
          .thenAnswer((_) async => [testTVTable]);
      // act
      final result = await repository.getWatchlistTVShows();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [testWatchlistTV]);
    });
  });
}