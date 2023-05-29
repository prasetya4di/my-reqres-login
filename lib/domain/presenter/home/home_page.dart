import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_reqres_login/domain/presenter/home/bloc/home_bloc.dart';
import 'package:my_reqres_login/domain/presenter/home/bloc/home_state.dart';
import 'package:my_reqres_login/domain/presenter/home/model/home_page_argument.dart';
import 'package:my_reqres_login/domain/presenter/home/widgets/profile_widget.dart';
import 'package:my_reqres_login/domain/presenter/widgets/alert.dart';

class HomePage extends StatelessWidget {
  final HomePageArgument argument;

  const HomePage({super.key, required this.argument});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout_rounded),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is HomeErrorState) {
                return Alert.danger(text: state.message);
              } else if (state is HomeSuccessState) {
                return ProfileWidget(user: state.user);
              } else {
                return const SizedBox();
              }
            },
            listener: (context, state) {},
          ),
        ),
      ),
    );
  }
}
