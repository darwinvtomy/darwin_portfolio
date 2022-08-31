import 'package:flutter/material.dart';

import 'elevate_on_hover.dart';

extension HoverExtension1 on Widget {
  Widget get moveUpOnHover {
    return ElevateOnHover(child: this);
  }

  Widget get moveUpOnHoverWithoutshadow {
    return ElevateOnHover(
      enableShadow: false,
      child: this,
    );
  }
}
