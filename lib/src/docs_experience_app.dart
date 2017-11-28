import 'dart:html';

import 'package:over_react/over_react.dart';
import 'package:shell_events/shell_events.dart' show ShellToggleMessagesEvent;

@Factory()
UiFactory<DocsExperienceAppProps> DocsExperienceApp;

@Props()
class DocsExperienceAppProps extends UiProps {
}

@State()
class DocsExperienceAppState extends UiState {
  int counter;
}

@Component()
class DocsExperienceAppComponent extends UiStatefulComponent<DocsExperienceAppProps, DocsExperienceAppState>  {
  ReactElement _toggleMessagesButton;

  Map getInitialState() => (newState()
    ..counter = 0
  );
  
  render() {
    return Dom.div()(
      (Dom.h4()..style = { 'margin': 0 })('Docs: using over_react 1.17.0'),
      Dom.p()('Counter: ' + state.counter.toString()),
      Dom.div()(
        Dom.p()('Docs Operations'),
        (Dom.button()..onClick = (event) => setState(newState()..counter = ++state.counter)
        )('Increment'),
        (Dom.button()..onClick = (event) => setState(newState()..counter = --state.counter)
        )('Decrement')
      ),
      Dom.div()(
        Dom.p()('Shell Operations'),
        (Dom.button()
          ..onClick = (event) {
            findDomNode(_toggleMessagesButton).dispatchEvent(new ShellToggleMessagesEvent());
          }
          ..ref = (ref) {
            _toggleMessagesButton = ref;
          }
        )('Toggle Shell Messages')
      )
    );
  }
}
