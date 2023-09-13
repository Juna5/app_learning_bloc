import 'package:app_learning_bloc/common/entities/entities.dart';
import 'package:app_learning_bloc/common/utils/http_util.dart';

class UserApi {
  static login({LoginRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'login',
      queryParamaters: params?.toJson(),
    );
    print('params ${params}');
  }
}
