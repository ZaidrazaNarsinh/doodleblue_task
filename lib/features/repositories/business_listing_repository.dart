import '../../model/response/model_response_business_list_entity.dart';
import '../../network/api_helper.dart';
import '../../network/api_response_handler.dart';
import '../../network/api_result.dart';
import '../../network/api_url.dart';

class BusinessListingRepository {
  Future<APIResultState<ModelResponseBusinessListEntity>>
      getBusinessList() async {
    var networkResult = await APIHelper.instance
        .callGetApi(NetworkConstant.getBusinessList, null, false);

    var apiResultFromNetwork =
        getAPIResultFromNetworkWithoutBase<ModelResponseBusinessListEntity>(
            networkResult);
    return apiResultFromNetwork;
  }
}
