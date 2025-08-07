import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:tikweb_task/features/repo_explorer/presentation/bloc/repo_bloc.dart';
import 'package:tikweb_task/features/repo_explorer/presentation/bloc/repo_state.dart';
import 'package:tikweb_task/features/repo_explorer/presentation/pages/home_screen.dart';

// Import the generated mock file
import '../bloc/repo_bloc_test.mocks.dart';

void main() {
  late MockRepoBloc mockRepoBloc;

  setUp(() {
    mockRepoBloc = MockRepoBloc();

    // Stub the current state
    when(
      mockRepoBloc.state,
    ).thenReturn(const RepoState(status: RepoStatus.loading));

    // Stub the stream of states emitted by the bloc
    whenListen(
      mockRepoBloc,
      Stream.fromIterable([
        const RepoState(status: RepoStatus.loading),
        const RepoState(status: RepoStatus.success, repos: []),
      ]),
    );
  });

  testWidgets('shows loading indicator when state is loading', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<RepoBloc>.value(
          value: mockRepoBloc,
          child: const HomeScreen(),
        ),
      ),
    );

    // Initially, state is loading, so CircularProgressIndicator should be shown
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Pump to allow state stream to emit the next state (success)
    await tester.pump();

    // After state changes to success and repos are empty, it should show "No repositories found"
    expect(find.text('No repositories found'), findsOneWidget);
  });
}
