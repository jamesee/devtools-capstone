name: ci
on: 
  pull_request:
    branches: [main]

jobs:
  run-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-node@v2
        with:
          node-version: '14'
      - name: Cache dependencies
        id: cache-step
        uses: actions/cache@v2
        with:
          path: ~/.npm
          key: v1-node-dependencies-${{ hashFiles('./package-lock.json') }}
          restore-keys: v1-node-dependencies-
      - name: Install dependencies
        run: npm ci
      - name: Run tests
        run: npm test