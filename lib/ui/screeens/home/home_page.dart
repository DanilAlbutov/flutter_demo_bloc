import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/home_bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final countTextEditingController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: "Home",
            ),
            Tab(
              text: "Main",
            ),
          ],
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (_, state) {
          if (state is HomeLoaded) {
            if (state.users != null) {
              Navigator.of(context).pushNamed('/list');
            }
          }
        },
        builder: (context, state) {
          return BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeLoaded) {
                if (state.users == null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Ошибка при загрузке данных.'),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: (() =>
                              context.read<HomeBloc>().add(SetInitialEvent())),
                          child: const Text("Назад"),
                        )
                      ],
                    ),
                  );
                }
              }
              return _initalUi();
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    countTextEditingController.dispose();
    super.dispose();
  }

  Widget _initalUi() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            child: TextFormField(
              controller: countTextEditingController,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: (() => context.read<HomeBloc>().add(GetDataEvent(
                int.tryParse(countTextEditingController.text) ?? 0))),
            child: const Text("Load data"),
          )
        ],
      ),
    );
  }
}
