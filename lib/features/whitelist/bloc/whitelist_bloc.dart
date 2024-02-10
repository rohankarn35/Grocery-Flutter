import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'whitelist_event.dart';
part 'whitelist_state.dart';

class WhitelistBloc extends Bloc<WhitelistEvent, WhitelistState> {
  WhitelistBloc() : super(WhitelistInitial()) {
    on<WhitelistEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
