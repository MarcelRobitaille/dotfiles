module.exports = {
  'env': {
    'browser': true,
    'node': true,
    'es6': true,
    'commonjs': true
  },
  plugins: [
    'lodash-fp',
  ],

  'extends': [
    'eslint:recommended',
  ],

  parser: 'babel-eslint',

  'parserOptions': {
    'ecmaFeatures': {
      'experimentalObjectRestSpread': true,
      'jsx': true
    },
    'sourceType': 'module'
  },

  'rules': {
    'indent': [ 'error', 2, {
      SwitchCase: 1,
    }],
    'linebreak-style': [ 'error', 'unix' ],
    'quotes': [ 'error', 'single' ],
    'semi': [ 'error', 'never' ],
    'no-console': 0,
    // 'prettier/prettier': ['error', {
    // singleQuote: true,
    // semi: false,
    // }],
    'lodash-fp/consistent-compose': 'off',
    'lodash-fp/consistent-name': [
      'error',
      '_'
    ],
    'lodash-fp/no-argumentless-calls': 'error',
    'lodash-fp/no-chain': 'error',
    'lodash-fp/no-extraneous-args': 'error',
    'lodash-fp/no-extraneous-function-wrapping': 'error',
    'lodash-fp/no-extraneous-iteratee-args': 'error',
    'lodash-fp/no-for-each': 'off',
    'lodash-fp/no-partial-of-curried': 'error',
    'lodash-fp/no-single-composition': 'error',
    'lodash-fp/no-submodule-destructuring': 'error',
    'lodash-fp/no-unused-result': 'error',
    'lodash-fp/prefer-compact': 'error',
    'lodash-fp/prefer-composition-grouping': 'error',
    'lodash-fp/prefer-constant': [
      'error',
      {
        'arrowFunctions': false
      }
    ],
    'lodash-fp/prefer-flat-map': 'error',
    'lodash-fp/prefer-get': 'error',
    'lodash-fp/prefer-identity': [
      'error',
      {
        'arrowFunctions': false
      }
    ],
    'lodash-fp/preferred-alias': 'off',
    'lodash-fp/use-fp': 'error'
  },
}

