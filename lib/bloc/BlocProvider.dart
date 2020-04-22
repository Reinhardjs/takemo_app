import 'package:flutter/cupertino.dart';

typedef UpdateShouldNotify<T> = bool Function(T bloc, _BlocProvider oldWidget);

abstract class BlocBase {
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  final T bloc;
  final Widget child;
  final UpdateShouldNotify<T> updateShouldNotifyOverride;

  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
    this.updateShouldNotifyOverride,
  }) : super(key: key);

  static _BlocProvider<T> of<T extends BlocBase>(BuildContext context,
      [bool attachContext = true]) =>
      _BlocProvider.of(context, attachContext);

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {
  @override
  Widget build(BuildContext context) {
    return _BlocProvider(
      bloc: widget.bloc,
      child: widget.child,
      rebuildDependent: rebuildDependent,
      updateShouldNotifyOverride: widget.updateShouldNotifyOverride,
    );
  }

  void rebuildDependent(){
    setState(() {

    });
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}

class _BlocProvider<T extends BlocBase> extends InheritedWidget {
  final T bloc;
  final Widget child;
  final Function rebuildDependent;
  final UpdateShouldNotify<T> updateShouldNotifyOverride;

  _BlocProvider({
    this.bloc,
    this.child,
    this.rebuildDependent,
    this.updateShouldNotifyOverride,
  }) : super(child: child);

  static _BlocProvider<T> of<T extends BlocBase>(BuildContext context, bool attachContext) {
    final type = _typeOf<_BlocProvider<T>>();
    final blocProvider = attachContext
        ? (context.inheritFromWidgetOfExactType(type) as _BlocProvider)
        : (context.ancestorInheritedElementForWidgetOfExactType(type)
    as _BlocProvider);

    if (blocProvider == null) {
      throw FlutterError('Unable to find BLoC of type $type.\n'
          'Context provided: $context');
    }
    return blocProvider;
  }

  static Type _typeOf<T>() => T;

  @override
  bool updateShouldNotify(_BlocProvider oldWidget) =>
      updateShouldNotifyOverride != null
          ? updateShouldNotifyOverride(bloc, oldWidget)
          : oldWidget.bloc != bloc;
}
