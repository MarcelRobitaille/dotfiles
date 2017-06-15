module.exports = {
  'env': {
    'browser': true,
    'node': true,
    'es6': true,
    'commonjs': true
  },
  // plugins: [
    // 'prettier',
  // ],

  'extends': 'eslint:recommended',

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
  }
}
