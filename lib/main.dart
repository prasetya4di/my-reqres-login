import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_reqres_login/data/repository/user_repository_impl.dart';
import 'package:my_reqres_login/data/source/network/chopper_factory.dart';
import 'package:my_reqres_login/data/source/network/service/login_service.dart';
import 'package:my_reqres_login/data/source/network/service/user_service.dart';
import 'package:my_reqres_login/domain/presenter/home/bloc/home_bloc.dart';
import 'package:my_reqres_login/domain/presenter/login/bloc/login_bloc.dart';
import 'package:my_reqres_login/domain/presenter/util/routes.dart';
import 'package:my_reqres_login/domain/repository/user_repository.dart';
import 'package:my_reqres_login/domain/usecase/get_user.dart';
import 'package:my_reqres_login/domain/usecase/impl/get_user_impl.dart';
import 'package:my_reqres_login/domain/usecase/impl/post_login_impl.dart';
import 'package:my_reqres_login/domain/usecase/post_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<ChopperClient>(
            create: (_) => ChopperFactory.create()),
        RepositoryProvider<UserService>(
            create: (ctx) => ctx.read<ChopperClient>().getService()),
        RepositoryProvider<LoginService>(
            create: (ctx) => ctx.read<ChopperClient>().getService()),
        RepositoryProvider<UserRepository>(
            create: (ctx) => UserRepositoryImpl(ctx.read(), ctx.read())),
        RepositoryProvider<PostLogin>(
            create: (ctx) => PostLoginImpl(ctx.read())),
        RepositoryProvider<GetUser>(create: (ctx) => GetUserImpl(ctx.read())),
        BlocProvider(create: (ctx) => LoginBloc(ctx.read())),
        BlocProvider(create: (ctx) => HomeBloc(ctx.read())),
      ],
      child: MaterialApp(
        title: 'My Reqres Login',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: generateRoute,
        initialRoute: Routes.login,
      ),
    );
  }
}
