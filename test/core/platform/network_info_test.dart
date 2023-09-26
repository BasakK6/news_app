import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/core/platform/network_info.dart';

import 'network_info_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Connectivity>()])
void main() {
  late NetworkInfoImplementation networkInfoImplementation;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkInfoImplementation = NetworkInfoImplementation(mockConnectivity);
  });

  group("checkConnection() tests", () {
    test("should forward the call to Connectivity().checkConnectivity()",
        () async {
      //arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((realInvocation) async => ConnectivityResult.wifi);
      //act
      await networkInfoImplementation.checkConnection();
      //assert
      verify(mockConnectivity.checkConnectivity());
    });

    group("there is a connection", () {
      test("should return true when there is a internet connection (wifi)",
          () async {
        //arrange
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((realInvocation) async => ConnectivityResult.wifi);
        //act
        final result = await networkInfoImplementation.checkConnection();
        //assert
        expect(result, true);
        verify(mockConnectivity.checkConnectivity());
      });

      test("should return true when there is a internet connection (ethernet)",
          () async {
        //arrange
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((realInvocation) async => ConnectivityResult.ethernet);
        //act
        final result = await networkInfoImplementation.checkConnection();
        //assert
        expect(result, true);
        verify(mockConnectivity.checkConnectivity());
      });

      test("should return true when there is a internet connection (mobile)",
          () async {
        //arrange
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((realInvocation) async => ConnectivityResult.mobile);
        //act
        final result = await networkInfoImplementation.checkConnection();
        //assert
        expect(result, true);
        verify(mockConnectivity.checkConnectivity());
      });
    });

    group("there is no connection", () {
      test(
          "should throw a ConnectivityException when there is no internet connection (bluetooth)",
          () async {
        //arrange
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((realInvocation) async => ConnectivityResult.bluetooth);
        //act
        final calledMethod = networkInfoImplementation.checkConnection;
        //assert
        expect(
            calledMethod, throwsA(const TypeMatcher<ConnectivityException>()));
        verify(mockConnectivity.checkConnectivity());
      });

      test(
          "should throw a ConnectivityException when there is no internet connection (none)",
          () async {
        //arrange
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((realInvocation) async => ConnectivityResult.none);
        //act
        final calledMethod = networkInfoImplementation.checkConnection;
        //assert
        expect(
            calledMethod, throwsA(const TypeMatcher<ConnectivityException>()));
        verify(mockConnectivity.checkConnectivity());
      });
    });
  });
}
