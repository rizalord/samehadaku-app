import 'package:bloc/bloc.dart';

class DownloadBloc extends Bloc<List, List> {
  @override
  List get initialState => [];

  @override
  Stream<List> mapEventToState(List event) async* {
    yield event;
  }
}
