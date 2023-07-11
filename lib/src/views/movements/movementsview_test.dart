import 'package:auto_route/auto_route.dart';
import 'package:admin_dashboard/proy/providers/movements_provider.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/src/views/movements/inputcreateView_test.dart';
import 'package:admin_dashboard/src/views/movements/movementscardsview.dart';
import 'package:admin_dashboard/src/views/movements/outputcreateView_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class MovementsViewTest extends StatefulWidget {
  const MovementsViewTest({Key? key}) : super(key: key);

  @override
  State<MovementsViewTest> createState() => _MovementsViewTestState();
}

class _MovementsViewTestState extends State<MovementsViewTest> {
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    Provider.of<ProductsProvider>(context, listen: false).getProducts();
    Provider.of<MovementsProvider>(context, listen: false)
        .getProductEntriesAndExits();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    final movimientos = Provider.of<MovementsProvider>(context).movimientos;

    return SizedBox(
      height: size - 75 - 95,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Movimientos"),
        ),
        body: MovementsCardsView(movimientos: movimientos),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IgnorePointer(
              ignoring: !isOpen,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isOpen ? 1 : 0,
                child: MediaQuery.of(context).size.width > 600
                    ? FloatingActionButton.extended(
                        heroTag: 'fab1',
                        onPressed: () {
                          _showDialogInput(context);
                        },
                        icon: const Icon(Icons.input),
                        label: const Text('Crear entrada'))
                    : FloatingActionButton(
                        onPressed: () {
                          _showDialogInput(context);
                        },
                        child: const Icon(Icons.input),
                      ),
              ),
            ),
            const SizedBox(height: 10),
            IgnorePointer(
              ignoring: !isOpen,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isOpen ? 1 : 0,
                child: MediaQuery.of(context).size.width > 600
                    ? FloatingActionButton.extended(
                        heroTag: 'fab2',
                        onPressed: () {
                          _showDialogOutput(context);
                        },
                        icon: const Icon(Icons.output),
                        label: const Text('Crear salida'))
                    : FloatingActionButton(
                        onPressed: () {
                          _showDialogOutput(context);
                        },
                        child: const Icon(Icons.output),
                      ),
              ),
            ),
            const SizedBox(height: 10),
            MediaQuery.of(context).size.width > 600
                ? FloatingActionButton.extended(
                    heroTag: 'fab3',
                    onPressed: () {
                      setState(() {
                        isOpen = !isOpen;
                      });
                    },
                    icon: Icon(isOpen ? Icons.close : Icons.add),
                    label: isOpen
                        ? MediaQuery.of(context).size.width > 600
                            ? const Text('Cancelar')
                            : const Text('')
                        : MediaQuery.of(context).size.width > 600
                            ? const Text('Crear movimiento')
                            : const Text(''),
                  )
                : FloatingActionButton(
                    heroTag: 'fab3',
                    onPressed: () {
                      setState(() {
                        isOpen = !isOpen;
                      });
                    },
                    child: Icon(isOpen ? Icons.close : Icons.add),
                  )
          ],
        ),
      ),
    );
  }

  void _showDialogInput(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text("Crear entrada de productos"),
          content: SingleChildScrollView(
            child: InputViewCreateTest(),
          ),
        );
      },
    );
  }

  void _showDialogOutput(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text("Crear salida de productos"),
          content: SingleChildScrollView(
            child: OutputViewCreateTest(),
          ),
        );
      },
    );
  }
}
