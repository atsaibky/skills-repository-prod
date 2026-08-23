## What it does

`ste` makes the [agent](https://www.aihero.dev/ai-coding-dictionary/agent) write in ASD-STE100 Simplified Technical English, the controlled language that aerospace and defense manuals are written in. Sentences are capped by length, verbs are restricted to a handful of tenses, and each meaning gets exactly one approved word.

It is a closed vocabulary, not a request to be brief. That is what makes it behave differently from telling the [model](https://www.aihero.dev/ai-coding-dictionary/model) to be concise: "be concise" is a judgement call the model answers by deleting words, so it drops articles and arrives at telegram English. STE names which words are allowed and how long a sentence can be, so the only way to comply is to restructure the sentence.

## When to reach for it

You invoke it by typing `/ste`, and the agent will not reach for it on its own. That is deliberate. STE is a register you choose for a document, not a default the agent should slip into when it guesses you want simpler prose.

| Situation | Reach for |
|---|---|
| Writing or rewriting docs a non-native English reader has to follow exactly | `/ste` |
| Procedures, runbooks, warnings, release notes going to a wide audience | `/ste` |
| One message that lost you, mid-conversation | [wait-what](https://aihero.dev/skills-wait-what) |
| Docs an agent will read, not a human | [writing-for-agents](https://aihero.dev/skills-writing-for-agents) |

## Procedural or descriptive

The first thing the skill does is classify the text, because every limit downstream depends on the answer. **Procedural** text is a set of instructions someone follows, and it is capped at 20 words per sentence. **Descriptive** text explains or describes, and it gets 25. A document with both gets classified section by section.

That classification also decides voice. Procedural text is imperative ("Open the panel"), never advisory ("You should open the panel"), and one instruction gets one sentence. Descriptive text can use the passive, but only where the actor is unknown or does not matter.

## One word, one meaning

The rule that does the most work is **one word, one meaning, one part of speech**. Synonym rotation is banned: if you called it the reservoir, it stays the reservoir for the rest of the document. `check`, `verify`, `confirm` and `validate` collapse into one approved form. `test` is a noun, so you do a test rather than test the system.

Two reference files carry the detail. `references/word-substitutions.md` is the working dictionary of unapproved words and their replacements, read before drafting. `references/examples.md` holds before/after rewrites, read when the target is existing text.

Code blocks, command strings, file paths, error messages and quoted UI text are left exactly as written. The standard applies to the prose around them.

## Common questions

**Does this make my document officially ASD-STE100 compliant?**
No. The official specification and its dictionary are copyright ASD, so the skill encodes paraphrased rules and a word list built from public sources. It gets you the register and most of the discipline. A certified aerospace or defense deliverable needs the free official specification from [asd-ste100.org](https://asd-ste100.org) and a human sign-off, and the skill says so rather than claiming compliance it cannot verify.

**Why can't the agent trigger it automatically on "simplify this"?**
Because STE is a strong, visible register, and "simplify this" usually means normal plain English. A skill that fires on paraphrased intent would rewrite casual replies into manual prose. It is user-invoked in both harnesses, so nothing but you can start it.

**Does it stay on for the rest of the session?**
It applies to the task you invoke it in. If you want to leave it, say so, and the agent confirms once before dropping the register.

## It's working if

- Sentences got restructured, not just clipped. Articles and the word "that" are still there.
- The same object has the same name everywhere in the document, with no synonym rotation.
- Warnings lead with the command, then the risk, rather than the other way round.
- No "should", "may" or "might" survives. Requirements read as "must", possibilities as "can".
- Code, paths and quoted UI strings came through untouched.

## Where it fits

`ste` is a reach-for-it-anytime standalone, off every flow. Its closest neighbour is [wait-what](https://aihero.dev/skills-wait-what), which asks for one message to be re-pitched and reaches for the same register when it does, so `/ste` is the whole-document version of a comprehension fix `wait-what` applies to a single reply. For prose aimed at agents rather than people, [writing-for-agents](https://aihero.dev/skills-writing-for-agents) is the one you want. [ask-matt](https://aihero.dev/skills-ask-matt) routes you if the moment is unclear.
