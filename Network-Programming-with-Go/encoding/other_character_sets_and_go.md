## Other character sets and Go

 There are very, very many character set encodings. According to Google, these generally only have a small use, which will hopefully decrease even further in time. But if your software wants to capture all markets, then you may need to handle them.

In the simplest cases, a lookup table will suffice. But that doesn't always work. The character coding ISO 2022 minimised character set sizes by using a finite state machine to swap code pages in and out. This was borrowed by some of the Japanese encodings, and makes things very complex.

Go does not at present give any language or package support for these other character sets. So you either avoid their use, fail to talk to applications that do use them, or write lots of your own code!

## Conclusion

There hasn't been much code in this chapter. Instead, there have been some of the concepts of a very complex area. It's up to you: if you want to assume everyone speaks US English then the world is simple. But if you want your applications to be usable by the rest of the world, then you need to pay attention to these complexities.

