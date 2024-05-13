import 'package:cubitpractice/cubit/to_do_cubit.dart';
import 'package:cubitpractice/domain/todo_state.dart';
import 'package:cubitpractice/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoView extends StatelessWidget {
  TodoView({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController updateNameController = TextEditingController();
  TextEditingController updateEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoCubit = ToDoCubit();
    return BlocProvider(
      create: (context) => todoCubit,
      child: BlocBuilder<ToDoCubit, TodoState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      maxLines: 1,
                      decoration: const InputDecoration(
                          hintText: "Name", border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: emailController,
                      maxLines: 1,
                      decoration: const InputDecoration(
                          hintText: "Email", border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<ToDoCubit>().addTodos(
                              name: nameController.text,
                              email: emailController.text);
                          nameController.clear();
                          emailController.clear();
                        },
                        child: const Text("Add")),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.todos.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(state.todos[index].name),
                            subtitle: Text(state.todos[index].email),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    updateNameController.text =
                                        state.todos[index].name;

                                    updateEmailController.text =
                                        state.todos[index].email;
                                    showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return BlocProvider.value(
                                            value: todoCubit,
                                            child: AlertDialog(
                                              title: const Text("Update"),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextField(
                                                    controller:
                                                        updateNameController,
                                                    maxLines: 1,
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText: "Name",
                                                            border:
                                                                OutlineInputBorder()),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  TextField(
                                                    controller:
                                                        updateEmailController,
                                                    maxLines: 1,
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText: "Email",
                                                            border:
                                                                OutlineInputBorder()),
                                                  ),
                                                ],
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      context
                                                          .read<ToDoCubit>()
                                                          .updateTodos(
                                                              index: index,
                                                              name:
                                                                  updateNameController
                                                                      .text,
                                                              email:
                                                                  updateEmailController
                                                                      .text);
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text("Update"))
                                              ],
                                            ));
                                      },
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    context
                                        .read<ToDoCubit>()
                                        .deleteTodos(index: index);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
