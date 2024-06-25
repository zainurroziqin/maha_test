import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maha_test/application/pages/cubit/user_cubit.dart';
import 'package:maha_test/application/widgets/user_card.dart';
import 'package:maha_test/injection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserCubit>(),
      child: const HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  @override
  void initState() {
    BlocProvider.of<UserCubit>(context).userRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Maha Test',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserStateLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserStateError) {
              return Text(state.message);
            } else if (state is UserStateLoaded) {
              return ListView.builder(
                itemCount: state.listUser.length,
                itemBuilder: (context, index) {
                  return UserCard(
                    email: state.listUser[index].email,
                    firstName: state.listUser[index].firstName,
                    lastName: state.listUser[index].lastName,
                    avatar: state.listUser[index].avatar,
                  );
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ));
  }
}
