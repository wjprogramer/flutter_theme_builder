part of 'theme_temp_utility.dart';

enum TOKENS_3P_GROUP {
  color('color'),
  light('light'),
  dark('dark'),
  elevation('elevation'),
  motion('motion'),
  palette('palette'),
  shape('shape'),
  state('state'),
  typeface('typeface'),
  typescale('typescale');

  const TOKENS_3P_GROUP(this.tokenGroupKey);

  final String tokenGroupKey;
}

const TOKENS_3P_COLOR = {
  "md.sys.color.scrim": {
    "name": "Scrim",
    "value": "md.ref.palette.neutral0"
  },
  "md.sys.color.outline-variant": {
    "name": "Outline Variant",
    "value": "md.ref.palette.neutral-variant80"
  },
  "md.sys.color.surface-tint": {
    "name": "Surface tint",
    "value": "md.sys.color.primary"
  },
  "md.sys.color.surface-tint-color": {
    "name": "Surface tint color",
    "value": "md.sys.color.primary"
  },
  "md.sys.color.on-error-container": {
    "name": "On error container",
    "value": "md.ref.palette.error10"
  },
  "md.sys.color.on-error": {
    "name": "On error",
    "value": "md.ref.palette.error100"
  },
  "md.sys.color.error-container": {
    "name": "Error container",
    "value": "md.ref.palette.error90"
  },
  "md.sys.color.on-tertiary-container": {
    "name": "On tertiary container",
    "value": "md.ref.palette.tertiary10"
  },
  "md.sys.color.on-tertiary": {
    "name": "On tertiary",
    "value": "md.ref.palette.tertiary100"
  },
  "md.sys.color.tertiary-container": {
    "name": "Tertiary container",
    "value": "md.ref.palette.tertiary90"
  },
  "md.sys.color.tertiary": {
    "name": "Tertiary",
    "value": "md.ref.palette.tertiary40"
  },
  "md.sys.color.shadow": {
    "name": "Shadow",
    "value": "md.ref.palette.neutral0"
  },
  "md.sys.color.error": {
    "name": "Error",
    "value": "md.ref.palette.error40"
  },
  "md.sys.color.outline": {
    "name": "Outline",
    "value": "md.ref.palette.neutral-variant50"
  },
  "md.sys.color.on-background": {
    "name": "On background",
    "value": "md.ref.palette.neutral10"
  },
  "md.sys.color.background": {
    "name": "Background",
    "value": "md.ref.palette.neutral99"
  },
  "md.sys.color.inverse-on-surface": {
    "name": "Inverse on surface",
    "value": "md.ref.palette.neutral95"
  },
  "md.sys.color.inverse-surface": {
    "name": "Inverse surface",
    "value": "md.ref.palette.neutral20"
  },
  "md.sys.color.on-surface-variant": {
    "name": "On surface variant",
    "value": "md.ref.palette.neutral-variant30"
  },
  "md.sys.color.on-surface": {
    "name": "On surface",
    "value": "md.ref.palette.neutral10"
  },
  "md.sys.color.surface-variant": {
    "name": "Surface Variant",
    "value": "md.ref.palette.neutral-variant90"
  },
  "md.sys.color.surface": {
    "name": "Surface",
    "value": "md.ref.palette.neutral99"
  },
  "md.sys.color.on-secondary-container": {
    "name": "On secondary container",
    "value": "md.ref.palette.secondary10"
  },
  "md.sys.color.on-secondary": {
    "name": "On secondary",
    "value": "md.ref.palette.secondary100"
  },
  "md.sys.color.secondary-container": {
    "name": "Secondary container",
    "value": "md.ref.palette.secondary90"
  },
  "md.sys.color.secondary": {
    "name": "Secondary",
    "value": "md.ref.palette.secondary40"
  },
  "md.sys.color.inverse-primary": {
    "name": "Inverse primary",
    "value": "md.ref.palette.primary80"
  },
  "md.sys.color.on-primary-container": {
    "name": "On primary container",
    "value": "md.ref.palette.primary10"
  },
  "md.sys.color.on-primary": {
    "name": "On primary",
    "value": "md.ref.palette.primary100"
  },
  "md.sys.color.primary-container": {
    "name": "Primary container",
    "value": "md.ref.palette.primary90"
  },
  "md.sys.color.primary": {
    "name": "Primary",
    "value": "md.ref.palette.primary40"
  }
};

const TOKENS_3P_LIGHT = {
  "md.sys.color.scrim": {
    "name": "Scrim",
    "value": "md.ref.palette.neutral0"
  },
  "md.sys.color.outline-variant": {
    "name": "Outline Variant",
    "value": "md.ref.palette.neutral-variant80"
  },
  "md.sys.color.surface-tint": {
    "name": "Surface tint",
    "value": "md.sys.color.primary"
  },
  "md.sys.color.surface-tint-color": {
    "name": "Surface tint color",
    "value": "md.sys.color.primary"
  },
  "md.sys.color.on-error-container": {
    "name": "On error container",
    "value": "md.ref.palette.error10"
  },
  "md.sys.color.on-error": {
    "name": "On error",
    "value": "md.ref.palette.error100"
  },
  "md.sys.color.error-container": {
    "name": "Error container",
    "value": "md.ref.palette.error90"
  },
  "md.sys.color.on-tertiary-container": {
    "name": "On tertiary container",
    "value": "md.ref.palette.tertiary10"
  },
  "md.sys.color.on-tertiary": {
    "name": "On tertiary",
    "value": "md.ref.palette.tertiary100"
  },
  "md.sys.color.tertiary-container": {
    "name": "Tertiary container",
    "value": "md.ref.palette.tertiary90"
  },
  "md.sys.color.tertiary": {
    "name": "Tertiary",
    "value": "md.ref.palette.tertiary40"
  },
  "md.sys.color.shadow": {
    "name": "Shadow",
    "value": "md.ref.palette.neutral0"
  },
  "md.sys.color.error": {
    "name": "Error",
    "value": "md.ref.palette.error40"
  },
  "md.sys.color.outline": {
    "name": "Outline",
    "value": "md.ref.palette.neutral-variant50"
  },
  "md.sys.color.on-background": {
    "name": "On background",
    "value": "md.ref.palette.neutral10"
  },
  "md.sys.color.background": {
    "name": "Background",
    "value": "md.ref.palette.neutral99"
  },
  "md.sys.color.inverse-on-surface": {
    "name": "Inverse on surface",
    "value": "md.ref.palette.neutral95"
  },
  "md.sys.color.inverse-surface": {
    "name": "Inverse surface",
    "value": "md.ref.palette.neutral20"
  },
  "md.sys.color.on-surface-variant": {
    "name": "On surface variant",
    "value": "md.ref.palette.neutral-variant30"
  },
  "md.sys.color.on-surface": {
    "name": "On surface",
    "value": "md.ref.palette.neutral10"
  },
  "md.sys.color.surface-variant": {
    "name": "Surface Variant",
    "value": "md.ref.palette.neutral-variant90"
  },
  "md.sys.color.surface": {
    "name": "Surface",
    "value": "md.ref.palette.neutral99"
  },
  "md.sys.color.on-secondary-container": {
    "name": "On secondary container",
    "value": "md.ref.palette.secondary10"
  },
  "md.sys.color.on-secondary": {
    "name": "On secondary",
    "value": "md.ref.palette.secondary100"
  },
  "md.sys.color.secondary-container": {
    "name": "Secondary container",
    "value": "md.ref.palette.secondary90"
  },
  "md.sys.color.secondary": {
    "name": "Secondary",
    "value": "md.ref.palette.secondary40"
  },
  "md.sys.color.inverse-primary": {
    "name": "Inverse primary",
    "value": "md.ref.palette.primary80"
  },
  "md.sys.color.on-primary-container": {
    "name": "On primary container",
    "value": "md.ref.palette.primary10"
  },
  "md.sys.color.on-primary": {
    "name": "On primary",
    "value": "md.ref.palette.primary100"
  },
  "md.sys.color.primary-container": {
    "name": "Primary container",
    "value": "md.ref.palette.primary90"
  },
  "md.sys.color.primary": {
    "name": "Primary",
    "value": "md.ref.palette.primary40"
  }
};

const TOKENS_3P_DARK = {
  "md.sys.color.scrim": {
    "name": "Scrim",
    "value": "md.ref.palette.neutral0"
  },
  "md.sys.color.outline-variant": {
    "name": "Outline Variant",
    "value": "md.ref.palette.neutral-variant30"
  },
  "md.sys.color.surface-tint": {
    "name": "Surface tint",
    "value": "md.sys.color.primary"
  },
  "md.sys.color.surface-tint-color": {
    "name": "Surface tint color",
    "value": "md.sys.color.primary"
  },
  "md.sys.color.on-error-container": {
    "name": "On error container",
    "value": "md.ref.palette.error90"
  },
  "md.sys.color.on-error": {
    "name": "On error",
    "value": "md.ref.palette.error20"
  },
  "md.sys.color.error-container": {
    "name": "Error container",
    "value": "md.ref.palette.error30"
  },
  "md.sys.color.on-tertiary-container": {
    "name": "On tertiary container",
    "value": "md.ref.palette.tertiary90"
  },
  "md.sys.color.on-tertiary": {
    "name": "On tertiary",
    "value": "md.ref.palette.tertiary20"
  },
  "md.sys.color.tertiary-container": {
    "name": "Tertiary container",
    "value": "md.ref.palette.tertiary30"
  },
  "md.sys.color.tertiary": {
    "name": "Tertiary",
    "value": "md.ref.palette.tertiary80"
  },
  "md.sys.color.shadow": {
    "name": "Shadow",
    "value": "md.ref.palette.neutral0"
  },
  "md.sys.color.error": {
    "name": "Error",
    "value": "md.ref.palette.error80"
  },
  "md.sys.color.outline": {
    "name": "Outline",
    "value": "md.ref.palette.neutral-variant60"
  },
  "md.sys.color.on-background": {
    "name": "On background",
    "value": "md.ref.palette.neutral90"
  },
  "md.sys.color.background": {
    "name": "Background",
    "value": "md.ref.palette.neutral10"
  },
  "md.sys.color.inverse-on-surface": {
    "name": "Inverse on surface",
    "value": "md.ref.palette.neutral20"
  },
  "md.sys.color.inverse-surface": {
    "name": "Inverse surface",
    "value": "md.ref.palette.neutral90"
  },
  "md.sys.color.on-surface-variant": {
    "name": "On surface variant",
    "value": "md.ref.palette.neutral-variant80"
  },
  "md.sys.color.on-surface": {
    "name": "On surface",
    "value": "md.ref.palette.neutral90"
  },
  "md.sys.color.surface-variant": {
    "name": "Surface Variant",
    "value": "md.ref.palette.neutral-variant30"
  },
  "md.sys.color.surface": {
    "name": "Surface",
    "value": "md.ref.palette.neutral10"
  },
  "md.sys.color.on-secondary-container": {
    "name": "On secondary container",
    "value": "md.ref.palette.secondary90"
  },
  "md.sys.color.on-secondary": {
    "name": "On secondary",
    "value": "md.ref.palette.secondary20"
  },
  "md.sys.color.secondary-container": {
    "name": "Secondary container",
    "value": "md.ref.palette.secondary30"
  },
  "md.sys.color.secondary": {
    "name": "Secondary",
    "value": "md.ref.palette.secondary80"
  },
  "md.sys.color.inverse-primary": {
    "name": "Inverse primary",
    "value": "md.ref.palette.primary40"
  },
  "md.sys.color.on-primary-container": {
    "name": "On primary container",
    "value": "md.ref.palette.primary90"
  },
  "md.sys.color.on-primary": {
    "name": "On primary",
    "value": "md.ref.palette.primary20"
  },
  "md.sys.color.primary-container": {
    "name": "Primary container",
    "value": "md.ref.palette.primary30"
  },
  "md.sys.color.primary": {
    "name": "Primary",
    "value": "md.ref.palette.primary80"
  }
};

const TOKENS_3P_ELEVATION = {
  "md.sys.elevation.level0": {
    "name": "0",
    "value": {
      "value": 0,
      "unit": 1
    }
  },
  "md.sys.elevation.level1": {
    "name": "+1",
    "value": {
      "value": 1,
      "unit": 1
    }
  },
  "md.sys.elevation.level2": {
    "name": "+2",
    "value": {
      "value": 3,
      "unit": 1
    }
  },
  "md.sys.elevation.level3": {
    "name": "+3",
    "value": {
      "value": 6,
      "unit": 1
    }
  },
  "md.sys.elevation.level4": {
    "name": "+4",
    "value": {
      "value": 8,
      "unit": 1
    }
  },
  "md.sys.elevation.level5": {
    "name": "+5",
    "value": {
      "value": 12,
      "unit": 1
    }
  }
};

const TOKENS_3P_MOTION = {
  "md.sys.motion.path": {
    "name": "Motion path",
    "value": {
      "standardPath": 1
    }
  },
  "md.sys.motion.easing.linear": {
    "name": "Linear",
    "value": {
      "x0":0,
      "y0":0,
      "x1":1,
      "y1":1
    }
  },
  "md.sys.motion.easing.standard": {
    "name": "Standard",
    "value": {
      "x0":.20000000298023224,
      "y0":0,
      "x1":0,
      "y1":1
    }
  },
  "md.sys.motion.duration.short1": {
    "name": "Short 1",
    "value": 50
  },
  "md.sys.motion.duration.short2": {
    "name": "Short 2",
    "value": 100
  },
  "md.sys.motion.duration.short3": {
    "name": "Short 3",
    "value": 150
  },
  "md.sys.motion.duration.short4": {
    "name": "Short 4",
    "value": 200
  },
  "md.sys.motion.duration.medium1": {
    "name": "Medium 1",
    "value": 250
  },
  "md.sys.motion.duration.medium2": {
    "name": "Medium 2",
    "value": 300
  },
  "md.sys.motion.duration.medium3": {
    "name": "Medium 3",
    "value": 350
  },
  "md.sys.motion.duration.medium4": {
    "name": "Medium 4",
    "value": 400
  },
  "md.sys.motion.duration.long1": {
    "name": "Long 1",
    "value": 450
  },
  "md.sys.motion.duration.long2": {
    "name": "Long 2",
    "value": 500
  },
  "md.sys.motion.duration.long3": {
    "name": "Long 3",
    "value": 550
  },
  "md.sys.motion.duration.long4": {
    "name": "Long 4",
    "value": 600
  },
  "md.sys.motion.duration.extra-long1": {
    "name": "Extra long 1",
    "value": 700
  },
  "md.sys.motion.duration.extra-long2": {
    "name": "Extra long 2",
    "value": 800
  },
  "md.sys.motion.duration.extra-long3": {
    "name": "Extra long 3",
    "value": 900
  },
  "md.sys.motion.duration.extra-long4": {
    "name": "Extra long 4",
    "value": 1E3
  },
  "md.sys.motion.easing.standard.accelerate": {
    "name": "Standard accelerate",
    "value": {
      "x0":.30000001192092896,
      "y0":0,
      "x1":1,
      "y1":1
    }
  },
  "md.sys.motion.easing.standard.decelerate": {
    "name": "Standard decelerate",
    "value": {
      "x0":0,
      "y0":0,
      "x1":0,
      "y1":1
    }
  },
  "md.sys.motion.easing.emphasized.accelerate": {
    "name": "Emphasized accelerate",
    "value": {
      "x0":.30000001192092896,
      "y0":0,
      "x1":.800000011920929,
      "y1":.15000000596046448
    }
  },
  "md.sys.motion.easing.emphasized.decelerate": {
    "name": "Emphasized decelerate",
    "value": {
      "x0":.05000000074505806,
      "y0":.699999988079071,
      "x1":.10000000149011612,
      "y1":1
    }
  },
  "md.sys.motion.easing.legacy": {
    "name": "Legacy",
    "value": {
      "x0":.4000000059604645,
      "y0":0,
      "x1":.20000000298023224,
      "y1":1
    }
  },
  "md.sys.motion.easing.legacy.accelerate": {
    "name": "Legacy accelerate",
    "value": {
      "x0":.4000000059604645,
      "y0":0,
      "x1":1,
      "y1":1
    }
  },
  "md.sys.motion.easing.legacy.decelerate": {
    "name": "Legacy decelerate",
    "value": {
      "x0":0,
      "y0":0,
      "x1":.20000000298023224,
      "y1":1
    }
  }
};

const TOKENS_3P_PALETTE = {
  "md.ref.palette.error0": {
    "name": "Error 0",
    "value": {
      "red": 0,
      "green": 0,
      "blue": 0,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.error10": {
    "name": "Error 10",
    "value": {
      "red": .2549019753932953,
      "green": .054901961237192154,
      "blue": .04313725605607033,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.error20": {
    "name": "Error 20",
    "value": {
      "red": .3764705955982208,
      "green": .0784313753247261,
      "blue": .062745101749897,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.error30": {
    "name": "Error 30",
    "value": {
      "red": .5490196347236633,
      "green": .11372549086809158,
      "blue": .0941176488995552,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.error40": {
    "name": "Error 40",
    "value": {
      "red": .7019608020782471,
      "green": .14901961386203766,
      "blue": .11764705926179886,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.error50": {
    "name": "Error 50",
    "value": {
      "red": .8627451062202454,
      "green": .21176470816135406,
      "blue": .18039216101169586,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.error60": {
    "name": "Error 60",
    "value": {
      "red": .8941176533699036,
      "green": .4117647111415863,
      "blue": .3843137323856354,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.error70": {
    "name": "Error 70",
    "value": {
      "red": .9254902005195618,
      "green": .572549045085907,
      "blue": .5568627715110779,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.error80": {
    "name": "Error 80",
    "value": {
      "red": .9490196108818054,
      "green": .7215686440467834,
      "blue": .7098039388656616,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.error90": {
    "name": "Error 90",
    "value": {
      "red": .9764705896377563,
      "green": .8705882430076599,
      "blue": .8627451062202454,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.error95": {
    "name": "Error 95",
    "value": {
      "red": .9882352948188782,
      "green": .9333333373069763,
      "blue": .9333333373069763,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.error99": {
    "name": "Error 99",
    "value": {
      "red": 1,
      "green": .9843137264251709,
      "blue": .9764705896377563,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.error100": {
    "name": "Error 100",
    "value": {
      "red": 1,
      "green": 1,
      "blue": 1,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.tertiary0": {
    "name": "Tertiary 0",
    "value": {
      "red": 0,
      "green": 0,
      "blue": 0,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.tertiary10": {
    "name": "Tertiary 10",
    "value": {
      "red": .1921568661928177,
      "green": .06666667014360428,
      "blue": .11372549086809158,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.tertiary20": {
    "name": "Tertiary 20",
    "value": {
      "red": .2862745225429535,
      "green": .14509804546833038,
      "blue": .19607843458652496,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.tertiary30": {
    "name": "Tertiary 30",
    "value": {
      "red": .38823530077934265,
      "green": .23137255012989044,
      "blue": .2823529541492462,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.tertiary40": {
    "name": "Tertiary 40",
    "value": {
      "red": .4901960790157318,
      "green": .32156863808631897,
      "blue": .3764705955982208,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.tertiary50": {
    "name": "Tertiary 50",
    "value": {
      "red": .5960784554481506,
      "green": .4117647111415863,
      "blue": .46666666865348816,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.tertiary60": {
    "name": "Tertiary 60",
    "value": {
      "red": .7098039388656616,
      "green": .5137255191802979,
      "blue": .572549045085907,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.tertiary70": {
    "name": "Tertiary 70",
    "value": {
      "red": .8235294222831726,
      "green": .615686297416687,
      "blue": .6745098233222961,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.tertiary80": {
    "name": "Tertiary 80",
    "value": {
      "red": .9372549057006836,
      "green": .7215686440467834,
      "blue": .7843137383460999,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.tertiary90": {
    "name": "Tertiary 90",
    "value": {
      "red": 1,
      "green": .8470588326454163,
      "blue": .8941176533699036,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.tertiary95": {
    "name": "Tertiary 95",
    "value": {
      "red": 1,
      "green": .9254902005195618,
      "blue": .9450980424880981,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.tertiary99": {
    "name": "Tertiary 99",
    "value": {
      "red": 1,
      "green": .9843137264251709,
      "blue": .9803921580314636,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.tertiary100": {
    "name": "Tertiary 100",
    "value": {
      "red": 1,
      "green": 1,
      "blue": 1,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.secondary0": {
    "name": "Secondary 0",
    "value": {
      "red": 0,
      "green": 0,
      "blue": 0,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.secondary10": {
    "name": "Secondary 10",
    "value": {
      "red": .11372549086809158,
      "green": .09803921729326248,
      "blue": .16862745583057404,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.secondary20": {
    "name": "Secondary 20",
    "value": {
      "red": .20000000298023224,
      "green": .1764705926179886,
      "blue": .2549019753932953,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.secondary30": {
    "name": "Secondary 30",
    "value": {
      "red": .29019609093666077,
      "green": .2666666805744171,
      "blue": .3450980484485626,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.secondary40": {
    "name": "Secondary 40",
    "value": {
      "red": .3843137323856354,
      "green": .35686275362968445,
      "blue": .4431372582912445,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.secondary50": {
    "name": "Secondary 50",
    "value": {
      "red": .47843137383461,
      "green": .4470588266849518,
      "blue": .5372549295425415,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.secondary60": {
    "name": "Secondary 60",
    "value": {
      "red": .5843137502670288,
      "green": .5529412031173706,
      "blue": .6470588445663452,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.secondary70": {
    "name": "Secondary 70",
    "value": {
      "red": .6901960968971252,
      "green": .6549019813537598,
      "blue": .7529411911964417,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.secondary80": {
    "name": "Secondary 80",
    "value": {
      "red": .800000011920929,
      "green": .7607843279838562,
      "blue": .8627451062202454,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.secondary90": {
    "name": "Secondary 90",
    "value": {
      "red": .9098039269447327,
      "green": .8705882430076599,
      "blue": .9725490212440491,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.secondary95": {
    "name": "Secondary 95",
    "value": {
      "red": .9647058844566345,
      "green": .929411768913269,
      "blue": 1,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.secondary99": {
    "name": "Secondary 99",
    "value": {
      "red": 1,
      "green": .9843137264251709,
      "blue": .9960784316062927,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.secondary100": {
    "name": "Secondary 100",
    "value": {
      "red": 1,
      "green": 1,
      "blue": 1,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.primary0": {
    "name": "Primary 0",
    "value": {
      "red": 0,
      "green": 0,
      "blue": 0,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.primary10": {
    "name": "Primary 10",
    "value": {
      "red": .12941177189350128,
      "green": 0,
      "blue": .364705890417099,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.primary20": {
    "name": "Primary 20",
    "value": {
      "red": .21960784494876862,
      "green": .11764705926179886,
      "blue": .4470588266849518,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.primary30": {
    "name": "Primary 30",
    "value": {
      "red": .30980393290519714,
      "green": .21568627655506134,
      "blue": .545098066329956,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.primary40": {
    "name": "Primary 40",
    "value": {
      "red": .40392157435417175,
      "green": .3137255012989044,
      "blue": .6431372761726379,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.primary50": {
    "name": "Primary 50",
    "value": {
      "red": .49803921580314636,
      "green": .40392157435417175,
      "blue": .7450980544090271,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.primary60": {
    "name": "Primary 60",
    "value": {
      "red": .6039215922355652,
      "green": .5098039507865906,
      "blue": .8588235378265381,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.primary70": {
    "name": "Primary 70",
    "value": {
      "red": .7137255072593689,
      "green": .615686297416687,
      "blue": .9725490212440491,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.primary80": {
    "name": "Primary 80",
    "value": {
      "red": .8156862854957581,
      "green": .7372549176216125,
      "blue": 1,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.primary90": {
    "name": "Primary 90",
    "value": {
      "red": .9176470637321472,
      "green": .8666666746139526,
      "blue": 1,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.primary95": {
    "name": "Primary 95",
    "value": {
      "red": .9647058844566345,
      "green": .929411768913269,
      "blue": 1,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.primary99": {
    "name": "Primary 99",
    "value": {
      "red": 1,
      "green": .9843137264251709,
      "blue": .9960784316062927,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.primary100": {
    "name": "Primary 100",
    "value": {
      "red": 1,
      "green": 1,
      "blue": 1,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral-variant0": {
    "name": "Neutral Variant 0",
    "value": {
      "red": 0,
      "green": 0,
      "blue": 0,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral-variant10": {
    "name": "Neutral Variant 10",
    "value": {
      "red": .11372549086809158,
      "green": .10196078568696976,
      "blue": .13333334028720856,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral-variant20": {
    "name": "Neutral Variant 20",
    "value": {
      "red": .19607843458652496,
      "green": .18431372940540314,
      "blue": .21568627655506134,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral-variant30": {
    "name": "Neutral Variant 30",
    "value": {
      "red": .2862745225429535,
      "green": .2705882489681244,
      "blue": .30980393290519714,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral-variant40": {
    "name": "Neutral Variant 40",
    "value": {
      "red": .3764705955982208,
      "green": .364705890417099,
      "blue": .4000000059604645,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral-variant50": {
    "name": "Neutral Variant 50",
    "value": {
      "red": .4745098054409027,
      "green": .45490196347236633,
      "blue": .4941176474094391,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral-variant60": {
    "name": "Neutral Variant 60",
    "value": {
      "red": .5764706134796143,
      "green": .5607843399047852,
      "blue": .6000000238418579,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral-variant70": {
    "name": "Neutral Variant 70",
    "value": {
      "red": .6823529601097107,
      "green": .6627451181411743,
      "blue": .7058823704719543,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral-variant80": {
    "name": "Neutral Variant 80",
    "value": {
      "red": .7921568751335144,
      "green": .7686274647712708,
      "blue": .8156862854957581,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral-variant90": {
    "name": "Neutral Variant 90",
    "value": {
      "red": .9058823585510254,
      "green": .8784313797950745,
      "blue": .9254902005195618,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral-variant95": {
    "name": "Neutral Variant 95",
    "value": {
      "red": .9607843160629272,
      "green": .9333333373069763,
      "blue": .9803921580314636,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral-variant99": {
    "name": "Neutral Variant 99",
    "value": {
      "red": 1,
      "green": .9843137264251709,
      "blue": .9960784316062927,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral-variant100": {
    "name": "Neutral Variant 100",
    "value": {
      "red": 1,
      "green": 1,
      "blue": 1,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral0": {
    "name": "Neutral 0",
    "value": {
      "red": 0,
      "green": 0,
      "blue": 0,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral10": {
    "name": "Neutral 10",
    "value": {
      "red": .10980392247438431,
      "green": .10588235408067703,
      "blue": .12156862765550613,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral20": {
    "name": "Neutral 20",
    "value": {
      "red": .1921568661928177,
      "green": .1882352977991104,
      "blue": .20000000298023224,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral30": {
    "name": "Neutral 30",
    "value": {
      "red": .2823529541492462,
      "green": .27450981736183167,
      "blue": .2862745225429535,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral40": {
    "name": "Neutral 40",
    "value": {
      "red": .3764705955982208,
      "green": .364705890417099,
      "blue": .3843137323856354,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral50": {
    "name": "Neutral 50",
    "value": {
      "red": .47058823704719543,
      "green": .4588235318660736,
      "blue": .4745098054409027,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral60": {
    "name": "Neutral 60",
    "value": {
      "red": .5764706134796143,
      "green": .5647059082984924,
      "blue": .5803921818733215,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral70": {
    "name": "Neutral 70",
    "value": {
      "red": .6823529601097107,
      "green": .6666666865348816,
      "blue": .6823529601097107,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral80": {
    "name": "Neutral 80",
    "value": {
      "red": .7882353067398071,
      "green": .772549033164978,
      "blue": .7921568751335144,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral90": {
    "name": "Neutral 90",
    "value": {
      "red": .9019607901573181,
      "green": .8823529481887817,
      "blue": .8980392217636108,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral95": {
    "name": "Neutral 95",
    "value": {
      "red": .95686274766922,
      "green": .9372549057006836,
      "blue": .95686274766922,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral99": {
    "name": "Neutral 99",
    "value": {
      "red": 1,
      "green": .9843137264251709,
      "blue": .9960784316062927,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.neutral100": {
    "name": "Neutral 100",
    "value": {
      "red": 1,
      "green": 1,
      "blue": 1,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.black": {
    "name": "Black",
    "value": {
      "red": 0,
      "green": 0,
      "blue": 0,
      "alpha": {
        "value": 1
      }
    }
  },
  "md.ref.palette.white": {
    "name": "White",
    "value": {
      "red": 1,
      "green": 1,
      "blue": 1,
      "alpha": {
        "value": 1
      }
    }
  }
};

const TOKENS_3P_SHAPE = {
  "md.sys.shape.corner.extra-small.top": {
    "name": "Extra small top rounding",
    "value": {
      "family": 1,
      "defaultSize": {
        "value": 0,
        "unit": 1
      },
      "topLeft": {
        "value": 4,
        "unit": 1
      },
      "topRight": {
        "value": 4,
        "unit": 1
      }
    }
  },
  "md.sys.shape.corner.extra-small": {
    "name": "Extra small rounding",
    "value": {
      "family": 1,
      "defaultSize": {
        "value": 4,
        "unit": 1
      }
    }
  },
  "md.sys.shape.corner.large": {
    "name": "Large rounding",
    "value": {
      "family": 1,
      "defaultSize": {
        "value": 16,
        "unit": 1
      }
    }
  },
  "md.sys.shape.corner.none": {
    "name": "No rounding",
    "value": {
      "family": 1,
      "defaultSize": {
        "value": 0,
        "unit": 1
      }
    }
  },
  "md.sys.shape.corner.large.start": {
    "name": "Large start rounding",
    "value": {
      "family": 1,
      "defaultSize": {
        "value": 0,
        "unit": 1
      },
      "topLeft": {
        "value": 16,
        "unit": 1
      },
      "bottomLeft": {
        "value": 16,
        "unit": 1
      }
    }
  },
  "md.sys.shape.corner.medium": {
    "name": "Medium rounding",
    "value": {
      "family": 1,
      "defaultSize": {
        "value": 12,
        "unit": 1
      }
    }
  },
  "md.sys.shape.corner.small": {
    "name": "Small rounding",
    "value": {
      "family": 1,
      "defaultSize": {
        "value": 8,
        "unit": 1
      }
    }
  },
  "md.sys.shape.corner.large.end": {
    "name": "Large end rounding",
    "value": {
      "family": 1,
      "defaultSize": {
        "value": 0,
        "unit": 1
      },
      "topRight": {
        "value": 16,
        "unit": 1
      },
      "bottomRight": {
        "value": 16,
        "unit": 1
      }
    }
  },
  "md.sys.shape.corner.large.top": {
    "name": "Large top rounding",
    "value": {
      "family": 1,
      "defaultSize": {
        "value": 0,
        "unit": 1
      },
      "topLeft": {
        "value": 16,
        "unit": 1
      },
      "topRight": {
        "value": 16,
        "unit": 1
      }
    }
  },
  "md.sys.shape.corner.extra-large": {
    "name": "Extra large rounding",
    "value": {
      "family": 1,
      "defaultSize": {
        "value": 28,
        "unit": 1
      }
    }
  },
  "md.sys.shape.corner.extra-large.top": {
    "name": "Extra large top rounding",
    "value": {
      "family": 1,
      "defaultSize": {
        "value": 0,
        "unit": 1
      },
      "topLeft": {
        "value": 28,
        "unit": 1
      },
      "topRight": {
        "value": 28,
        "unit": 1
      }
    }
  },
  "md.sys.shape.corner.full": {
    "name": "Fully rounded",
    "value": {
      "family": 3
    }
  }
};

const TOKENS_3P_STATE = {
  "md.sys.state.hover.state-layer-opacity": {
    "name": "Hover state layer opacity",
    "value": .07999999821186066
  },
  "md.sys.state.focus.state-layer-opacity": {
    "name": "Focus state layer opacity",
    "value": .11999999731779099
  },
  "md.sys.state.pressed.state-layer-opacity": {
    "name": "Pressed state layer opacity",
    "value": .11999999731779099
  },
  "md.sys.state.dragged.state-layer-opacity": {
    "name": "Dragged state layer opacity",
    "value": .1599999964237213
  }
};

const TOKENS_3P_TYPEFACE = {
  "md.ref.typeface.plain": {
    "name": "Plain typeface",
    "value": {
      "valuesList": ["Roboto"]
    }
  },
  "md.ref.typeface.brand": {
    "name": "Brand typeface",
    "value": {
      "valuesList": ["Roboto"]
    }
  },
  "md.ref.typeface.weight-bold": {
    "name": "Bold weight",
    "value": 700
  },
  "md.ref.typeface.weight-medium": {
    "name": "Medium weight",
    "value": 500
  },
  "md.ref.typeface.weight-regular": {
    "name": "Regular weight",
    "value": 400
  }
};

const TOKENS_3P_TYPESCALE = {
  "md.sys.typescale.label-medium.text-transform": {
    "name": "Label Medium text transform",
    "value": 1
  },
  "md.sys.typescale.label-small": {
    "name": "Label Small",
    "value": {
      "font": "",
      "weight": 0,
      "sizePoints": 0,
      "trackingPoints": 0,
      "lineHeightPoints": 0,
      "axisValuesList": [],
      "fontNameTokenName": "md.sys.typescale.label-small.font",
      "fontWeightTokenName": "md.sys.typescale.label-small.weight",
      "fontSizeTokenName": "md.sys.typescale.label-small.size",
      "fontTrackingTokenName": "md.sys.typescale.label-small.tracking",
      "lineHeightTokenName": "md.sys.typescale.label-small.line-height"
    }
  },
  "md.sys.typescale.label-small.line-height": {
    "name": "Label Small line height",
    "value": {
      "value": 16,
      "unit": 2
    }
  },
  "md.sys.typescale.label-small.tracking": {
    "name": "Label Small font tracking",
    "value": {
      "value": .5,
      "unit": 2
    }
  },
  "md.sys.typescale.label-small.size": {
    "name": "Label Small font size",
    "value": {
      "value": 11,
      "unit": 2
    }
  },
  "md.sys.typescale.label-small.weight": {
    "name": "Label Small font weight",
    "value": "md.ref.typeface.weight-medium"
  },
  "md.sys.typescale.label-small.font": {
    "name": "Label Small font name",
    "value": "md.ref.typeface.plain"
  },
  "md.sys.typescale.label-medium": {
    "name": "Label Medium",
    "value": {
      "font": "",
      "weight": 0,
      "sizePoints": 0,
      "trackingPoints": 0,
      "lineHeightPoints": 0,
      "axisValuesList": [],
      "fontNameTokenName": "md.sys.typescale.label-medium.font",
      "fontWeightTokenName": "md.sys.typescale.label-medium.weight",
      "fontSizeTokenName": "md.sys.typescale.label-medium.size",
      "fontTrackingTokenName": "md.sys.typescale.label-medium.tracking",
      "lineHeightTokenName": "md.sys.typescale.label-medium.line-height"
    }
  },
  "md.sys.typescale.label-medium.line-height": {
    "name": "Label Medium line height",
    "value": {
      "value": 16,
      "unit": 2
    }
  },
  "md.sys.typescale.label-medium.tracking": {
    "name": "Label Medium font tracking",
    "value": {
      "value": .5,
      "unit": 2
    }
  },
  "md.sys.typescale.label-medium.size": {
    "name": "Label Medium font size",
    "value": {
      "value": 12,
      "unit": 2
    }
  },
  "md.sys.typescale.label-medium.weight": {
    "name": "Label Medium font weight",
    "value": "md.ref.typeface.weight-medium"
  },
  "md.sys.typescale.label-medium.font": {
    "name": "Label Medium font name",
    "value": "md.ref.typeface.plain"
  },
  "md.sys.typescale.label-large": {
    "name": "Label Large",
    "value": {
      "font": "",
      "weight": 0,
      "sizePoints": 0,
      "trackingPoints": 0,
      "lineHeightPoints": 0,
      "axisValuesList": [],
      "fontNameTokenName": "md.sys.typescale.label-large.font",
      "fontWeightTokenName": "md.sys.typescale.label-large.weight",
      "fontSizeTokenName": "md.sys.typescale.label-large.size",
      "fontTrackingTokenName": "md.sys.typescale.label-large.tracking",
      "lineHeightTokenName": "md.sys.typescale.label-large.line-height"
    }
  },
  "md.sys.typescale.label-large.line-height": {
    "name": "Label Large line height",
    "value": {
      "value": 20,
      "unit": 2
    }
  },
  "md.sys.typescale.label-large.tracking": {
    "name": "Label Large font tracking",
    "value": {
      "value": .10000000149011612,
      "unit": 2
    }
  },
  "md.sys.typescale.label-large.size": {
    "name": "Label Large font size",
    "value": {
      "value": 14,
      "unit": 2
    }
  },
  "md.sys.typescale.label-large.weight": {
    "name": "Label Large font weight",
    "value": "md.ref.typeface.weight-medium"
  },
  "md.sys.typescale.label-large.font": {
    "name": "Label Large font name",
    "value": "md.ref.typeface.plain"
  },
  "md.sys.typescale.body-small": {
    "name": "Body Small",
    "value": {
      "font": "",
      "weight": 0,
      "sizePoints": 0,
      "trackingPoints": 0,
      "lineHeightPoints": 0,
      "axisValuesList": [],
      "fontNameTokenName": "md.sys.typescale.body-small.font",
      "fontWeightTokenName": "md.sys.typescale.body-small.weight",
      "fontSizeTokenName": "md.sys.typescale.body-small.size",
      "fontTrackingTokenName": "md.sys.typescale.body-small.tracking",
      "lineHeightTokenName": "md.sys.typescale.body-small.line-height"
    }
  },
  "md.sys.typescale.body-small.line-height": {
    "name": "Body Small line height",
    "value": {
      "value": 16,
      "unit": 2
    }
  },
  "md.sys.typescale.body-small.tracking": {
    "name": "Body Small font tracking",
    "value": {
      "value": .4000000059604645,
      "unit": 2
    }
  },
  "md.sys.typescale.body-small.size": {
    "name": "Body Small font size",
    "value": {
      "value": 12,
      "unit": 2
    }
  },
  "md.sys.typescale.body-small.weight": {
    "name": "Body Small font weight",
    "value": "md.ref.typeface.weight-regular"
  },
  "md.sys.typescale.body-small.font": {
    "name": "Body Small font name",
    "value": "md.ref.typeface.plain"
  },
  "md.sys.typescale.body-medium": {
    "name": "Body Medium",
    "value": {
      "font": "",
      "weight": 0,
      "sizePoints": 0,
      "trackingPoints": 0,
      "lineHeightPoints": 0,
      "axisValuesList": [],
      "fontNameTokenName": "md.sys.typescale.body-medium.font",
      "fontWeightTokenName": "md.sys.typescale.body-medium.weight",
      "fontSizeTokenName": "md.sys.typescale.body-medium.size",
      "fontTrackingTokenName": "md.sys.typescale.body-medium.tracking",
      "lineHeightTokenName": "md.sys.typescale.body-medium.line-height"
    }
  },
  "md.sys.typescale.body-medium.line-height": {
    "name": "Body Medium line height",
    "value": {
      "value": 20,
      "unit": 2
    }
  },
  "md.sys.typescale.body-medium.tracking": {
    "name": "Body Medium font tracking",
    "value": {
      "value": .25,
      "unit": 2
    }
  },
  "md.sys.typescale.body-medium.size": {
    "name": "Body Medium font size",
    "value": {
      "value": 14,
      "unit": 2
    }
  },
  "md.sys.typescale.body-medium.weight": {
    "name": "Body Medium font weight",
    "value": "md.ref.typeface.weight-regular"
  },
  "md.sys.typescale.body-medium.font": {
    "name": "Body Medium font name",
    "value": "md.ref.typeface.plain"
  },
  "md.sys.typescale.body-large": {
    "name": "Body Large",
    "value": {
      "font": "",
      "weight": 0,
      "sizePoints": 0,
      "trackingPoints": 0,
      "lineHeightPoints": 0,
      "axisValuesList": [],
      "fontNameTokenName": "md.sys.typescale.body-large.font",
      "fontWeightTokenName": "md.sys.typescale.body-large.weight",
      "fontSizeTokenName": "md.sys.typescale.body-large.size",
      "fontTrackingTokenName": "md.sys.typescale.body-large.tracking",
      "lineHeightTokenName": "md.sys.typescale.body-large.line-height"
    }
  },
  "md.sys.typescale.body-large.line-height": {
    "name": "Body Large line height",
    "value": {
      "value": 24,
      "unit": 2
    }
  },
  "md.sys.typescale.body-large.tracking": {
    "name": "Body Large font tracking",
    "value": {
      "value": .5,
      "unit": 2
    }
  },
  "md.sys.typescale.body-large.size": {
    "name": "Body Large font size",
    "value": {
      "value": 16,
      "unit": 2
    }
  },
  "md.sys.typescale.body-large.weight": {
    "name": "Body Large font weight",
    "value": "md.ref.typeface.weight-regular"
  },
  "md.sys.typescale.body-large.font": {
    "name": "Body Large font name",
    "value": "md.ref.typeface.plain"
  },
  "md.sys.typescale.title-small": {
    "name": "Title Small",
    "value": {
      "font": "",
      "weight": 0,
      "sizePoints": 0,
      "trackingPoints": 0,
      "lineHeightPoints": 0,
      "axisValuesList": [],
      "fontNameTokenName": "md.sys.typescale.title-small.font",
      "fontWeightTokenName": "md.sys.typescale.title-small.weight",
      "fontSizeTokenName": "md.sys.typescale.title-small.size",
      "fontTrackingTokenName": "md.sys.typescale.title-small.tracking",
      "lineHeightTokenName": "md.sys.typescale.title-small.line-height"
    }
  },
  "md.sys.typescale.title-small.line-height": {
    "name": "Title Small line height",
    "value": {
      "value": 20,
      "unit": 2
    }
  },
  "md.sys.typescale.title-small.tracking": {
    "name": "Title Small font tracking",
    "value": {
      "value": .10000000149011612,
      "unit": 2
    }
  },
  "md.sys.typescale.title-small.size": {
    "name": "Title Small font size",
    "value": {
      "value": 14,
      "unit": 2
    }
  },
  "md.sys.typescale.title-small.weight": {
    "name": "Title Small font weight",
    "value": "md.ref.typeface.weight-medium"
  },
  "md.sys.typescale.title-small.font": {
    "name": "Title Small font name",
    "value": "md.ref.typeface.plain"
  },
  "md.sys.typescale.title-medium": {
    "name": "Title Medium",
    "value": {
      "font": "",
      "weight": 0,
      "sizePoints": 0,
      "trackingPoints": 0,
      "lineHeightPoints": 0,
      "axisValuesList": [],
      "fontNameTokenName": "md.sys.typescale.title-medium.font",
      "fontWeightTokenName": "md.sys.typescale.title-medium.weight",
      "fontSizeTokenName": "md.sys.typescale.title-medium.size",
      "fontTrackingTokenName": "md.sys.typescale.title-medium.tracking",
      "lineHeightTokenName": "md.sys.typescale.title-medium.line-height"
    }
  },
  "md.sys.typescale.title-medium.line-height": {
    "name": "Title Medium line height",
    "value": {
      "value": 24,
      "unit": 2
    }
  },
  "md.sys.typescale.title-medium.tracking": {
    "name": "Title Medium font tracking",
    "value": {
      "value": .15000000596046448,
      "unit": 2
    }
  },
  "md.sys.typescale.title-medium.size": {
    "name": "Title Medium font size",
    "value": {
      "value": 16,
      "unit": 2
    }
  },
  "md.sys.typescale.title-medium.weight": {
    "name": "Title Medium font weight",
    "value": "md.ref.typeface.weight-medium"
  },
  "md.sys.typescale.title-medium.font": {
    "name": "Title Medium font name",
    "value": "md.ref.typeface.plain"
  },
  "md.sys.typescale.title-large": {
    "name": "Title Large",
    "value": {
      "font": "",
      "weight": 0,
      "sizePoints": 0,
      "trackingPoints": 0,
      "lineHeightPoints": 0,
      "axisValuesList": [],
      "fontNameTokenName": "md.sys.typescale.title-large.font",
      "fontWeightTokenName": "md.sys.typescale.title-large.weight",
      "fontSizeTokenName": "md.sys.typescale.title-large.size",
      "fontTrackingTokenName": "md.sys.typescale.title-large.tracking",
      "lineHeightTokenName": "md.sys.typescale.title-large.line-height"
    }
  },
  "md.sys.typescale.title-large.line-height": {
    "name": "Title Large line height",
    "value": {
      "value": 28,
      "unit": 2
    }
  },
  "md.sys.typescale.title-large.tracking": {
    "name": "Title Large font tracking",
    "value": {
      "value": 0,
      "unit": 2
    }
  },
  "md.sys.typescale.title-large.size": {
    "name": "Title Large font size",
    "value": {
      "value": 22,
      "unit": 2
    }
  },
  "md.sys.typescale.title-large.weight": {
    "name": "Title Large font weight",
    "value": "md.ref.typeface.weight-regular"
  },
  "md.sys.typescale.title-large.font": {
    "name": "Title Large font name",
    "value": "md.ref.typeface.brand"
  },
  "md.sys.typescale.headline-small": {
    "name": "Headline Small",
    "value": {
      "font": "",
      "weight": 0,
      "sizePoints": 0,
      "trackingPoints": 0,
      "lineHeightPoints": 0,
      "axisValuesList": [],
      "fontNameTokenName": "md.sys.typescale.headline-small.font",
      "fontWeightTokenName": "md.sys.typescale.headline-small.weight",
      "fontSizeTokenName": "md.sys.typescale.headline-small.size",
      "fontTrackingTokenName": "md.sys.typescale.headline-small.tracking",
      "lineHeightTokenName": "md.sys.typescale.headline-small.line-height"
    }
  },
  "md.sys.typescale.headline-small.line-height": {
    "name": "Headline Small line height",
    "value": {
      "value": 32,
      "unit": 2
    }
  },
  "md.sys.typescale.headline-small.tracking": {
    "name": "Headline Small font tracking",
    "value": {
      "value": 0,
      "unit": 2
    }
  },
  "md.sys.typescale.headline-small.size": {
    "name": "Headline Small font size",
    "value": {
      "value": 24,
      "unit": 2
    }
  },
  "md.sys.typescale.headline-small.weight": {
    "name": "Headline Small font weight",
    "value": "md.ref.typeface.weight-regular"
  },
  "md.sys.typescale.headline-small.font": {
    "name": "Headline Small font name",
    "value": "md.ref.typeface.brand"
  },
  "md.sys.typescale.headline-medium": {
    "name": "Headline Medium",
    "value": {
      "font": "",
      "weight": 0,
      "sizePoints": 0,
      "trackingPoints": 0,
      "lineHeightPoints": 0,
      "axisValuesList": [],
      "fontNameTokenName": "md.sys.typescale.headline-medium.font",
      "fontWeightTokenName": "md.sys.typescale.headline-medium.weight",
      "fontSizeTokenName": "md.sys.typescale.headline-medium.size",
      "fontTrackingTokenName": "md.sys.typescale.headline-medium.tracking",
      "lineHeightTokenName": "md.sys.typescale.headline-medium.line-height"
    }
  },
  "md.sys.typescale.headline-medium.line-height": {
    "name": "Headline Medium line height",
    "value": {
      "value": 36,
      "unit": 2
    }
  },
  "md.sys.typescale.headline-medium.tracking": {
    "name": "Headline Medium font tracking",
    "value": {
      "value": 0,
      "unit": 2
    }
  },
  "md.sys.typescale.headline-medium.size": {
    "name": "Headline Medium font size",
    "value": {
      "value": 28,
      "unit": 2
    }
  },
  "md.sys.typescale.headline-medium.weight": {
    "name": "Headline Medium font weight",
    "value": "md.ref.typeface.weight-regular"
  },
  "md.sys.typescale.headline-medium.font": {
    "name": "Headline Medium font name",
    "value": "md.ref.typeface.brand"
  },
  "md.sys.typescale.headline-large": {
    "name": "Headline Large",
    "value": {
      "font": "",
      "weight": 0,
      "sizePoints": 0,
      "trackingPoints": 0,
      "lineHeightPoints": 0,
      "axisValuesList": [],
      "fontNameTokenName": "md.sys.typescale.headline-large.font",
      "fontWeightTokenName": "md.sys.typescale.headline-large.weight",
      "fontSizeTokenName": "md.sys.typescale.headline-large.size",
      "fontTrackingTokenName": "md.sys.typescale.headline-large.tracking",
      "lineHeightTokenName": "md.sys.typescale.headline-large.line-height"
    }
  },
  "md.sys.typescale.headline-large.line-height": {
    "name": "Headline Large line height",
    "value": {
      "value": 40,
      "unit": 2
    }
  },
  "md.sys.typescale.headline-large.tracking": {
    "name": "Headline Large font tracking",
    "value": {
      "value": 0,
      "unit": 2
    }
  },
  "md.sys.typescale.headline-large.size": {
    "name": "Headline Large font size",
    "value": {
      "value": 32,
      "unit": 2
    }
  },
  "md.sys.typescale.headline-large.font": {
    "name": "Headline Large font name",
    "value": "md.ref.typeface.brand"
  },
  "md.sys.typescale.headline-large.weight": {
    "name": "Headline Large font weight",
    "value": "md.ref.typeface.weight-regular"
  },
  "md.sys.typescale.display-small": {
    "name": "Display Small",
    "value": {
      "font": "",
      "weight": 0,
      "sizePoints": 0,
      "trackingPoints": 0,
      "lineHeightPoints": 0,
      "axisValuesList": [],
      "fontNameTokenName": "md.sys.typescale.display-small.font",
      "fontWeightTokenName": "md.sys.typescale.display-small.weight",
      "fontSizeTokenName": "md.sys.typescale.display-small.size",
      "fontTrackingTokenName": "md.sys.typescale.display-small.tracking",
      "lineHeightTokenName": "md.sys.typescale.display-small.line-height"
    }
  },
  "md.sys.typescale.display-small.line-height": {
    "name": "Display Small line height",
    "value": {
      "value": 44,
      "unit": 2
    }
  },
  "md.sys.typescale.display-small.tracking": {
    "name": "Display Small font tracking",
    "value": {
      "value": 0,
      "unit": 2
    }
  },
  "md.sys.typescale.display-small.size": {
    "name": "Display Small font size",
    "value": {
      "value": 36,
      "unit": 2
    }
  },
  "md.sys.typescale.display-small.weight": {
    "name": "Display Small font weight",
    "value": "md.ref.typeface.weight-regular"
  },
  "md.sys.typescale.display-small.font": {
    "name": "Display Small font name",
    "value": "md.ref.typeface.brand"
  },
  "md.sys.typescale.display-medium": {
    "name": "Display Medium",
    "value": {
      "font": "",
      "weight": 0,
      "sizePoints": 0,
      "trackingPoints": 0,
      "lineHeightPoints": 0,
      "axisValuesList": [],
      "fontNameTokenName": "md.sys.typescale.display-medium.font",
      "fontWeightTokenName": "md.sys.typescale.display-medium.weight",
      "fontSizeTokenName": "md.sys.typescale.display-medium.size",
      "fontTrackingTokenName": "md.sys.typescale.display-medium.tracking",
      "lineHeightTokenName": "md.sys.typescale.display-medium.line-height"
    }
  },
  "md.sys.typescale.display-medium.line-height": {
    "name": "Display Medium line height",
    "value": {
      "value": 52,
      "unit": 2
    }
  },
  "md.sys.typescale.display-medium.tracking": {
    "name": "Display Medium font tracking",
    "value": {
      "value": 0,
      "unit": 2
    }
  },
  "md.sys.typescale.display-medium.size": {
    "name": "Display Medium font size",
    "value": {
      "value": 45,
      "unit": 2
    }
  },
  "md.sys.typescale.display-medium.weight": {
    "name": "Display Medium font weight",
    "value": "md.ref.typeface.weight-regular"
  },
  "md.sys.typescale.display-medium.font": {
    "name": "Display Medium font name",
    "value": "md.ref.typeface.brand"
  },
  "md.sys.typescale.display-large": {
    "name": "Display Large",
    "value": {
      "font": "",
      "weight": 0,
      "sizePoints": 0,
      "trackingPoints": 0,
      "lineHeightPoints": 0,
      "axisValuesList": [],
      "fontNameTokenName": "md.sys.typescale.display-large.font",
      "fontWeightTokenName": "md.sys.typescale.display-large.weight",
      "fontSizeTokenName": "md.sys.typescale.display-large.size",
      "fontTrackingTokenName": "md.sys.typescale.display-large.tracking",
      "lineHeightTokenName": "md.sys.typescale.display-large.line-height"
    }
  },
  "md.sys.typescale.display-large.line-height": {
    "name": "Display Large line height",
    "value": {
      "value": 64,
      "unit": 2
    }
  },
  "md.sys.typescale.display-large.tracking": {
    "name": "Display Large font tracking",
    "value": {
      "value": -.25,
      "unit": 2
    }
  },
  "md.sys.typescale.display-large.size": {
    "name": "Display Large font size",
    "value": {
      "value": 57,
      "unit": 2
    }
  },
  "md.sys.typescale.display-large.weight": {
    "name": "Display Large font weight",
    "value": "md.ref.typeface.weight-regular"
  },
  "md.sys.typescale.display-large.font": {
    "name": "Display Large font name",
    "value": "md.ref.typeface.brand"
  }
};

const TOKENS_3P = {
  TOKENS_3P_GROUP.color: TOKENS_3P_COLOR,
  TOKENS_3P_GROUP.light: TOKENS_3P_LIGHT,
  TOKENS_3P_GROUP.dark: TOKENS_3P_DARK,
  TOKENS_3P_GROUP.elevation: TOKENS_3P_ELEVATION,
  TOKENS_3P_GROUP.motion: TOKENS_3P_MOTION,
  TOKENS_3P_GROUP.palette: TOKENS_3P_PALETTE,
  TOKENS_3P_GROUP.shape: TOKENS_3P_SHAPE,
  TOKENS_3P_GROUP.state: TOKENS_3P_STATE,
  TOKENS_3P_GROUP.typeface: TOKENS_3P_TYPEFACE,
  TOKENS_3P_GROUP.typescale: TOKENS_3P_TYPESCALE,
};