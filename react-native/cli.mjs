#!/usr/bin/env node
import * as esbuild from "esbuild";

const { stdin } = process;

console.log(`\x1b[31m
                        ▒▒▓▓▓▓▒▒
                     ▒▓▓▓▒▒░░▒▒▓▓▓▒
                  ▒▓▓▓▓░░░▒▒▒▒░░░▓▓▓▓▒
                 ▓▓▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▓▓
                 ▓▓░░░░░▒▓▓▓▓▓▓▒░░░░░▓▓
                 ▓▓░░▓▓▒░░░▒▒░░░▒▓▒░░▓▓
                 ▓▓░░▓▓▓▓▓▒😭▒▓▓▓▓▒░░▓▓
                 ▓▓░░▓▓▓▓▓▓▓▓▓▓▓▓▓▒░░▓▓
                 ▓▓▒░░▒▒▓▓▓▓▓▓▓▓▒░░░▒▓▓
                  ▒▓▓▓▒░░░▒▓▓▒░░░▒▓▓▓▒
                     ▒▓▓▓▒░░░░▒▓▓▓▒
                        ▒▒▓▓▓▓▒▒


              Welcome to ScuffedMetro v1.0.0
          Slow - Shit - Possibly just esbuild`);

const ctx = await esbuild.context({
  entryPoints: ["./index.js"],
  bundle: true,
  outfile: "./dist/index.bundle",
});

await ctx.watch();

let { host, port } = await ctx.serve({
  servedir: "./dist",
});

stdin.setRawMode(true);
stdin.resume();
stdin.setEncoding("utf8");

stdin.on("data", async (key) => {
  switch (key) {
    // reload
    case "r":
      console.log("REEEEEEEEEEEEEEEloading");
      await ctx.rebuild();
      break;
    case "\u0003":
    case "q":
      console.log("Lol bye");
      process.exit();
      break;
    default:
      break;
  }
});

console.log(`Serving on http://${host}:${port}/index.bundle

Press 'r' to reload, and 'q' to quit.`);
