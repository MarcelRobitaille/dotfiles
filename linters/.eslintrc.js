module.exports = {
  'env': {
    'browser': true,
    'node': true,
    'es6': true,
    'commonjs': true
  },

  'extends': 'eslint:recommended',

  'parserOptions': {
    'ecmaFeatures': {
      'experimentalObjectRestSpread': true,
      'jsx': true
    },
    'sourceType': 'module'
  },

  'rules': {
    'indent': [ 'error', 2 ],
    'linebreak-style': [ 'error', 'unix' ],
    'quotes': [ 'error', 'single' ],
    'semi': [ 'error', 'never' ],
    'no-console': 0,
  }
}
