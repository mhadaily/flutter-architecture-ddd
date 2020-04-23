import 'package:flutter/material.dart';
import 'package:flutter_architecture_ddd/catalog/presentation/widgets/catalog_name.dart';
import 'package:flutter_architecture_ddd/injections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class CatalogListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatalogListBloc>(
      builder: (BuildContext context) {
        return serviceLocator<CatalogListBloc>()..add(FetchCatalogListEvent());
      },
      child: BlocBuilder<CatalogListBloc, CatalogListState>(
        builder: (BuildContext context, CatalogListState state) {
          if (state is CatalogListLoadedState) {
            return ListView.builder(
              itemCount: state.products.length ?? 0,
              itemBuilder: (BuildContext context, dynamic product) {
                return CatalogName(name: product.name);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
