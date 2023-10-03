# ScuffedAct Native 🤮

_It's like React-Native but really, really scuffed!_

![](images/ScuffedAct.png)

## Why? / Disclaimer

This is a project I threw together to learn more about the internals of React-Native,
**please don't expect anything remotely polished** (hence the name).
It's pretty much just a barebones proof-of-concept of how to run React on a native OS.

If you are curious feel free to browse the (cursed) source code. I might write
a blog post on it at some point, in which case I'll link that here.

## To Do

- Flexbox with Yoga
- Hot reload with websockets
- Android _mayyyybeee, but probably not_

## Usage

```bash
pnpm install
```

```bash
pnpm run start
```

This will start the ~~esbuild~~ ScuffedMetro™ dev server.

The JavaScript bundle is served to `localhost:8000/index.bundle` and made available inside of `dist/`. When you build and run the Xcode ios project, it should read the bundle from here.

If it can't, uhh it will probably crash? idk tbh

## Features

- Runs on (only) ios!
- Lukewarm-reloading! (The JS will build on changes, but you gotta rebuild the native app)
- Supports `<Text />`!

## Running Tests

To run tests, run the following command

```bash
pnpm run test
```

## Optimizations

I left out android, native modules, native components, turbo modules, fabric components, JNI, Yoga, hermes, and about 99% of the expected components.

## Acknowledgements

uhhhh i'd like to thank the academy, my mum, uhhh my cat...

## Used By

No one I hope lol
