import 'package:doodleblue_task/features/cubits/business_list_cubit.dart';
import 'package:doodleblue_task/features/repositories/business_listing_repository.dart';
import 'package:doodleblue_task/model/response/model_response_business_list_entity.dart';
import 'package:doodleblue_task/network/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements BusinessListingRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockRepository mockRepository;
  late BusinessListCubit cubit;
  final APIResultState<ModelResponseBusinessListEntity> successResult =
      SuccessState(
    "",
    ModelResponseBusinessListEntity()..businesses = [],
  );
  const APIResultState<ModelResponseBusinessListEntity> failureResult =
      FailureState("Failure");
  

  setUp(() {
    mockRepository = MockRepository();
    cubit = BusinessListCubit(mockRepository);
  });

  void arrangeSuccessRepositoryReturn() {
    when(() => mockRepository.getBusinessList())
        .thenAnswer((invocation) async => successResult);
  }

  void arrangeFailureRepositoryReturn() {
    when(() => mockRepository.getBusinessList())
        .thenAnswer((invocation) async => failureResult);
  }

  group("To test success and failure response from cubit", () {
    test("Check failure cubit response", () async {
      arrangeFailureRepositoryReturn();
      cubit.callGetBusinessListAPI();
      expect([const LoadingState(), failureResult],
          [const LoadingState(), failureResult]);
    });
    test(
      "Check success cubit response",
      () async {
        arrangeSuccessRepositoryReturn();
        cubit.callGetBusinessListAPI();
        expect([const LoadingState(), successResult],
            [const LoadingState(), successResult]);
      },
    );
  });
}
