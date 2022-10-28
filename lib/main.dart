import 'package:cities_list_blocx/blocx/app_blocx.dart';
import 'package:cities_list_blocx/blocx/app_events.dart';
import 'package:cities_list_blocx/blocx/app_state.dart';
import 'package:cities_list_blocx/models/cities_model.dart';
import 'package:cities_list_blocx/repos/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RepositoryProvider(
        create: (context) => CityRepositories(),
        child: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> CityBloc(
        RepositoryProvider.of<CityRepositories>(context),
      )..add(LoadCityEvent()), 
      child: Scaffold(
        appBar: AppBar(
          title:const Text('Cities List'),
        ),
        body: BlocBuilder<CityBloc,CityState>(
          builder: (context, state) {
            if(state is CityLoadingState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CityLoadedState) {
              List<CityModel> cityList=state.cities;
              return ListView.builder(
                itemCount: cityList.length,
                itemBuilder: (_, index){
                  print(cityList[index].name);
                  print('ye chala ha');
                  return Card(
                    color: Colors.black,
                    elevation: 5,
                    margin:const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title:Text(cityList[index].name, style:const TextStyle(color: Colors.black45),),
                      subtitle: Text("${cityList[index].countid}"),
                    ),
                  );
                },
              );
            }
            if (state is CityErrorState) {
              return Center(
                child: Text('errorhappond'),
              );
            }
              return Container();
          },
        ),
      ),
      );
  }
}



