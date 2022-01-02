import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repos/github_repos/data/data_repository.dart';
import 'package:github_repos/github_repos/data/dio_client.dart';
import 'package:github_repos/github_repos/data/models/repository/repository.dart';
import 'package:github_repos/github_repos/logic/repository_bloc/repositories_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockDioClient extends Mock implements DioClient {}

void main() {
  late DataRepository dataRepository;
  late MockDioClient mockDioClient;

  final mockRepositories = [
    Repository(
      id: 1,
      fullName: 'repositoryFullName',
      url: 'repository/url',
      pullsUrl: 'pulls/url',
      issuesUrl: 'issue/url',
    ),
  ];

  setUp(() {
    dataRepository = DataRepository(MockDioClient());
    mockDioClient = MockDioClient();
  });

  tearDown(() {});

  test('initial state is RepositoriesState.loading()', () {
    expect(
      RepositoriesBloc(dataRepository: dataRepository).state,
      const RepositoriesState.loading(),
    );
  });

  group('Load public repositories', () {
    blocTest<RepositoriesBloc, RepositoriesState>(
      'emits nothing when repositories are no longer passed',
      build: () => RepositoriesBloc(dataRepository: dataRepository),
      seed: () => const RepositoriesState.content([], '', true),
      act: (bloc) => bloc.add(const RepositoriesEvent.loadRepositories()),
      expect: () => <RepositoriesState>[],
    );

    blocTest<RepositoriesBloc, RepositoriesState>(
      'emits loading state when loadRepositories is added.',
      build: () => RepositoriesBloc(dataRepository: dataRepository),
      act: (bloc) => bloc.add(const RepositoriesEvent.loadRepositories()),
      expect: () =>
          const <RepositoriesState>[RepositoriesState.content([], '', false)],
    );
  });

  blocTest<RepositoriesBloc, RepositoriesState>(
    'emits successful status when http fetches initial posts',
    setUp: () {
      when(() => dataRepository.fetchRepositories()).thenAnswer((_) async {
        return [
          Repository(
            id: 1,
            fullName: 'repositoryFullName',
            url: 'repository/url',
            pullsUrl: 'pulls/url',
            issuesUrl: 'issue/url',
          ),
        ] as Future<List<Repository>>;
      });
    },
    build: () => RepositoriesBloc(dataRepository: dataRepository),
    act: (bloc) => bloc.add(const RepositoriesEvent.loadRepositories()),
    expect: () => <RepositoriesState>[
      RepositoriesState.content(
        mockRepositories,
        '',
        false,
      ),
    ],
    verify: (_) {
      verify(() => dataRepository.fetchRepositories());
    },
  );
}
