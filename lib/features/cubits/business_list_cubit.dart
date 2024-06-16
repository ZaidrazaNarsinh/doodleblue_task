import 'dart:async';

import 'package:doodleblue_task/model/response/model_response_business_list_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../network/api_result.dart';
import '../repositories/business_listing_repository.dart';

class BusinessListCubit
    extends Cubit<APIResultState<ModelResponseBusinessListEntity>?> {
  BusinessListCubit(this.businessListingRepository) : super(null);
  final BusinessListingRepository businessListingRepository;

  Future<void> callGetBusinessListAPI() async {
    emit(const LoadingState());

    final APIResultState<ModelResponseBusinessListEntity> apiResultFromNetwork =
        await businessListingRepository.getBusinessList();

    emit(apiResultFromNetwork);
  }
}
