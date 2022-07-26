import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home_bloc/home_bloc.dart';
import 'package:flutter_demo_bloc/ui/home/users_list_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final countTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          title: Text(widget.title),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeLoaded) {
              if (state.users != null) {
                return UsersList(users: state.users);
              } else {
                return const Center(
                  child: Text('Ошибка при загрузке данных.'),
                );
              }
            } else if (state is HomeInitial) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      child: TextFormField(
                          controller: countTextEditingController,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: (() => context.read<HomeBloc>().add(
                          GetDataEvent(
                              int.parse(countTextEditingController.text)))),
                      child: const Text("Load data"),
                    )
                  ],
                ),
              );
            }
            return const Center(
              child: Text('-'),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    countTextEditingController.dispose();
    super.dispose();
  }
}
