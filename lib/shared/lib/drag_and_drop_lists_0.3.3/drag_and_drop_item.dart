import 'package:flutter/widgets.dart';
import 'package:task_manager/shared/lib/drag_and_drop_lists_0.3.3/drag_and_drop_interface.dart';

class DragAndDropItem implements DragAndDropInterface {
  /// The child widget of this item.
  final Widget child;

  /// Widget when draggable
  final Widget? feedbackWidget;

  /// Whether or not this item can be dragged.
  /// Set to true if it can be reordered.
  /// Set to false if it must remain fixed.
  final bool canDrag;
  final void Function(bool isDragging)? onDragging;

  DragAndDropItem({
    required this.child,
    this.feedbackWidget,
    this.canDrag = true,
    this.onDragging,
  });
}
