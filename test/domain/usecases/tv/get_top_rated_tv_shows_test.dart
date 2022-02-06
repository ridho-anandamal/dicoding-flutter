
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_top_rated_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main(){
  late GetTopRatedTVShows usecase;
  late MockTVRepository repository;

  setUp(() {
    repository = MockTVRepository();
    usecase = GetTopRatedTVShows(repository: repository);
  });
  final tTV = <TV>[];

  test('should get list top rated of tv shows from the repository when execute function is called', () async {
    // arrange
    when(repository.getTopRatedTVShows())
        .thenAnswer((_) async => Right(tTV));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTV));
  });
}