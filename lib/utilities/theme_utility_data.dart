part of 'theme_utility.dart';

enum TOKENS_3P_GROUP {
  color('color'),
  light('light'),
  dark('dark'),
  palette('palette');

  const TOKENS_3P_GROUP(this.tokenGroupKey);

  final String tokenGroupKey;
}

const _TOKENS_3P_COLOR = {
  "md.sys.color.scrim": {
    "value": "md.ref.palette.neutral0"
  },
  "md.sys.color.outline-variant": {
    "value": "md.ref.palette.neutral-variant80"
  },
  "md.sys.color.surface-tint": {
    "value": "md.sys.color.primary"
  },
  "md.sys.color.surface-tint-color": {
    "value": "md.sys.color.primary"
  },
  "md.sys.color.on-error-container": {
    "value": "md.ref.palette.error10"
  },
  "md.sys.color.on-error": {
    "value": "md.ref.palette.error100"
  },
  "md.sys.color.error-container": {
    "value": "md.ref.palette.error90"
  },
  "md.sys.color.on-tertiary-container": {
    "value": "md.ref.palette.tertiary10"
  },
  "md.sys.color.on-tertiary": {
    "value": "md.ref.palette.tertiary100"
  },
  "md.sys.color.tertiary-container": {
    "value": "md.ref.palette.tertiary90"
  },
  "md.sys.color.tertiary": {
    "value": "md.ref.palette.tertiary40"
  },
  "md.sys.color.shadow": {
    "value": "md.ref.palette.neutral0"
  },
  "md.sys.color.error": {
    "value": "md.ref.palette.error40"
  },
  "md.sys.color.outline": {
    "value": "md.ref.palette.neutral-variant50"
  },
  "md.sys.color.on-background": {
    "value": "md.ref.palette.neutral10"
  },
  "md.sys.color.background": {
    "value": "md.ref.palette.neutral99"
  },
  "md.sys.color.inverse-on-surface": {
    "value": "md.ref.palette.neutral95"
  },
  "md.sys.color.inverse-surface": {
    "value": "md.ref.palette.neutral20"
  },
  "md.sys.color.on-surface-variant": {
    "value": "md.ref.palette.neutral-variant30"
  },
  "md.sys.color.on-surface": {
    "value": "md.ref.palette.neutral10"
  },
  "md.sys.color.surface-variant": {
    "value": "md.ref.palette.neutral-variant90"
  },
  "md.sys.color.surface": {
    "value": "md.ref.palette.neutral99"
  },
  "md.sys.color.on-secondary-container": {
    "value": "md.ref.palette.secondary10"
  },
  "md.sys.color.on-secondary": {
    "value": "md.ref.palette.secondary100"
  },
  "md.sys.color.secondary-container": {
    "value": "md.ref.palette.secondary90"
  },
  "md.sys.color.secondary": {
    "value": "md.ref.palette.secondary40"
  },
  "md.sys.color.inverse-primary": {
    "value": "md.ref.palette.primary80"
  },
  "md.sys.color.on-primary-container": {
    "value": "md.ref.palette.primary10"
  },
  "md.sys.color.on-primary": {
    "value": "md.ref.palette.primary100"
  },
  "md.sys.color.primary-container": {
    "value": "md.ref.palette.primary90"
  },
  "md.sys.color.primary": {
    "value": "md.ref.palette.primary40"
  }
};

const _TOKENS_3P_LIGHT = {
  "md.sys.color.scrim": {
    "value": "md.ref.palette.neutral0"
  },
  "md.sys.color.outline-variant": {
    "value": "md.ref.palette.neutral-variant80"
  },
  "md.sys.color.surface-tint": {
    "value": "md.sys.color.primary"
  },
  "md.sys.color.surface-tint-color": {
    "value": "md.sys.color.primary"
  },
  "md.sys.color.on-error-container": {
    "value": "md.ref.palette.error10"
  },
  "md.sys.color.on-error": {
    "value": "md.ref.palette.error100"
  },
  "md.sys.color.error-container": {
    "value": "md.ref.palette.error90"
  },
  "md.sys.color.on-tertiary-container": {
    "value": "md.ref.palette.tertiary10"
  },
  "md.sys.color.on-tertiary": {
    "value": "md.ref.palette.tertiary100"
  },
  "md.sys.color.tertiary-container": {
    "value": "md.ref.palette.tertiary90"
  },
  "md.sys.color.tertiary": {
    "value": "md.ref.palette.tertiary40"
  },
  "md.sys.color.shadow": {
    "value": "md.ref.palette.neutral0"
  },
  "md.sys.color.error": {
    "value": "md.ref.palette.error40"
  },
  "md.sys.color.outline": {
    "value": "md.ref.palette.neutral-variant50"
  },
  "md.sys.color.on-background": {
    "value": "md.ref.palette.neutral10"
  },
  "md.sys.color.background": {
    "value": "md.ref.palette.neutral99"
  },
  "md.sys.color.inverse-on-surface": {
    "value": "md.ref.palette.neutral95"
  },
  "md.sys.color.inverse-surface": {
    "value": "md.ref.palette.neutral20"
  },
  "md.sys.color.on-surface-variant": {
    "value": "md.ref.palette.neutral-variant30"
  },
  "md.sys.color.on-surface": {
    "value": "md.ref.palette.neutral10"
  },
  "md.sys.color.surface-variant": {
    "value": "md.ref.palette.neutral-variant90"
  },
  "md.sys.color.surface": {
    "value": "md.ref.palette.neutral99"
  },
  "md.sys.color.on-secondary-container": {
    "value": "md.ref.palette.secondary10"
  },
  "md.sys.color.on-secondary": {
    "value": "md.ref.palette.secondary100"
  },
  "md.sys.color.secondary-container": {
    "value": "md.ref.palette.secondary90"
  },
  "md.sys.color.secondary": {
    "value": "md.ref.palette.secondary40"
  },
  "md.sys.color.inverse-primary": {
    "value": "md.ref.palette.primary80"
  },
  "md.sys.color.on-primary-container": {
    "value": "md.ref.palette.primary10"
  },
  "md.sys.color.on-primary": {
    "value": "md.ref.palette.primary100"
  },
  "md.sys.color.primary-container": {
    "value": "md.ref.palette.primary90"
  },
  "md.sys.color.primary": {
    "value": "md.ref.palette.primary40"
  }
};

const _TOKENS_3P_DARK = {
  "md.sys.color.scrim": {
    "value": "md.ref.palette.neutral0"
  },
  "md.sys.color.outline-variant": {
    "value": "md.ref.palette.neutral-variant30"
  },
  "md.sys.color.surface-tint": {
    "value": "md.sys.color.primary"
  },
  "md.sys.color.surface-tint-color": {
    "value": "md.sys.color.primary"
  },
  "md.sys.color.on-error-container": {
    "value": "md.ref.palette.error90"
  },
  "md.sys.color.on-error": {
    "value": "md.ref.palette.error20"
  },
  "md.sys.color.error-container": {
    "value": "md.ref.palette.error30"
  },
  "md.sys.color.on-tertiary-container": {
    "value": "md.ref.palette.tertiary90"
  },
  "md.sys.color.on-tertiary": {
    "value": "md.ref.palette.tertiary20"
  },
  "md.sys.color.tertiary-container": {
    "value": "md.ref.palette.tertiary30"
  },
  "md.sys.color.tertiary": {
    "value": "md.ref.palette.tertiary80"
  },
  "md.sys.color.shadow": {
    "value": "md.ref.palette.neutral0"
  },
  "md.sys.color.error": {
    "value": "md.ref.palette.error80"
  },
  "md.sys.color.outline": {
    "value": "md.ref.palette.neutral-variant60"
  },
  "md.sys.color.on-background": {
    "value": "md.ref.palette.neutral90"
  },
  "md.sys.color.background": {
    "value": "md.ref.palette.neutral10"
  },
  "md.sys.color.inverse-on-surface": {
    "value": "md.ref.palette.neutral20"
  },
  "md.sys.color.inverse-surface": {
    "value": "md.ref.palette.neutral90"
  },
  "md.sys.color.on-surface-variant": {
    "value": "md.ref.palette.neutral-variant80"
  },
  "md.sys.color.on-surface": {
    "value": "md.ref.palette.neutral90"
  },
  "md.sys.color.surface-variant": {
    "value": "md.ref.palette.neutral-variant30"
  },
  "md.sys.color.surface": {
    "value": "md.ref.palette.neutral10"
  },
  "md.sys.color.on-secondary-container": {
    "value": "md.ref.palette.secondary90"
  },
  "md.sys.color.on-secondary": {
    "value": "md.ref.palette.secondary20"
  },
  "md.sys.color.secondary-container": {
    "value": "md.ref.palette.secondary30"
  },
  "md.sys.color.secondary": {
    "value": "md.ref.palette.secondary80"
  },
  "md.sys.color.inverse-primary": {
    "value": "md.ref.palette.primary40"
  },
  "md.sys.color.on-primary-container": {
    "value": "md.ref.palette.primary90"
  },
  "md.sys.color.on-primary": {
    "value": "md.ref.palette.primary20"
  },
  "md.sys.color.primary-container": {
    "value": "md.ref.palette.primary30"
  },
  "md.sys.color.primary": {
    "value": "md.ref.palette.primary80"
  }
};

const _TOKENS_3P_PALETTE = {
  "md.ref.palette.error0": {
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

const _TOKENS_3P = {
  TOKENS_3P_GROUP.color: _TOKENS_3P_COLOR,
  TOKENS_3P_GROUP.light: _TOKENS_3P_LIGHT,
  TOKENS_3P_GROUP.dark: _TOKENS_3P_DARK,
  TOKENS_3P_GROUP.palette: _TOKENS_3P_PALETTE,
};