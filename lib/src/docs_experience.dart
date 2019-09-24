import 'dart:html';

import 'package:react/react_client.dart';
import 'package:react/react_dom.dart' as react;

import 'docs_experience_app.dart';


class DocsExperience {
  final HtmlElement element;

  DocsExperience(this.element) {
    setClientConfiguration();

    ShadowRoot shadow = element.attachShadow({'mode': 'open'});
    react.render(DocsExperienceApp()(), shadow);
  }
}
