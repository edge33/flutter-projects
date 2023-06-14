import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key,
      required this.expenses,
      required this.onRemoveExpense,
      required this.listKey,
      required this.dismissDirection});

  final List<Expense> expenses;
  final void Function(Expense expense, DismissDirection direction)
      onRemoveExpense;
  final GlobalKey<AnimatedListState> listKey;
  final DismissDirection dismissDirection;

  @override
  Widget build(BuildContext context) {
    final tweenOffset =
        dismissDirection == DismissDirection.endToStart ? -1.0 : 1.0;

    return AnimatedList(
      key: listKey,
      initialItemCount: expenses.length,
      itemBuilder: (ctx, index, animation) => SlideTransition(
        position: animation.drive(
          Tween(
            begin: Offset(tweenOffset, 0),
            end: const Offset(0, 0),
          ),
        ),
        child: Dismissible(
          key: ValueKey(expenses[index]),
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          ),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index], direction);
            listKey.currentState!.removeItem(index, (_, __) => Container());
          },
          child: ExpenseItem(expenses[index]),
        ),
      ),
    );
  }
}
