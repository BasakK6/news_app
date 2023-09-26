// Mocks generated by Mockito 5.4.2 from annotations
// in news_app/test/features/news_feed/data/repositories/news_feed_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:news_app/core/platform/network_info.dart' as _i3;
import 'package:news_app/features/news_feed/data/data_sources/news_feed_remote_data_source.dart'
    as _i5;
import 'package:news_app/features/news_feed/data/models/news_feed_model.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeNewsFeedModel_0 extends _i1.SmartFake implements _i2.NewsFeedModel {
  _FakeNewsFeedModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i3.NetworkInfo {
  @override
  _i4.Future<bool> checkConnection() => (super.noSuchMethod(
        Invocation.method(
          #checkConnection,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

/// A class which mocks [NewsFeedRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockNewsFeedRemoteDataSource extends _i1.Mock
    implements _i5.NewsFeedRemoteDataSource {
  @override
  _i4.Future<_i2.NewsFeedModel> getNewsFeedForCategory(String? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNewsFeedForCategory,
          [category],
        ),
        returnValue: _i4.Future<_i2.NewsFeedModel>.value(_FakeNewsFeedModel_0(
          this,
          Invocation.method(
            #getNewsFeedForCategory,
            [category],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.NewsFeedModel>.value(_FakeNewsFeedModel_0(
          this,
          Invocation.method(
            #getNewsFeedForCategory,
            [category],
          ),
        )),
      ) as _i4.Future<_i2.NewsFeedModel>);
}