import 'dart:html';

import 'package:over_react/over_react.dart';
import 'package:shell_events/shell_events.dart' show ShellToggleMessagesEvent;

part 'docs_experience_app.over_react.g.dart';

@Factory()
UiFactory<DocsExperienceAppProps> DocsExperienceApp = _$DocsExperienceApp;

@Props()
class _$DocsExperienceAppProps extends UiProps {
}

@State()
class _$DocsExperienceAppState extends UiState {
  int counter;
}

@Component()
class DocsExperienceAppComponent extends UiStatefulComponent<DocsExperienceAppProps, DocsExperienceAppState>  {
  ButtonElement _toggleMessagesButton;

  Map getInitialState() => (newState()
    ..counter = 0
  );

  render() {
    return Dom.div()(
      (Dom.h4()..style = { 'margin': 0 })('Docs: using over_react 3.0.0-wip'),
      Dom.p()('Counter: ' + state.counter.toString()),
      Dom.div()(
        Dom.p()('Docs Operations'),
        (Dom.button()..onClick = (event) => setState(newState()..counter = ++state.counter))('Increment'),
        (Dom.button()..onClick = (event) => setState(newState()..counter = --state.counter))('Decrement')
      ),
      Dom.div()(
        Dom.p()('Shell Operations'),
        (Dom.button()
          ..onClick = (event) {
            _toggleMessagesButton.dispatchEvent(new ShellToggleMessagesEvent().e);
          }
          ..ref = (ref) {
            _toggleMessagesButton = ref;
          }
        )('Toggle Shell Messages')
      )
    );
  }
}
