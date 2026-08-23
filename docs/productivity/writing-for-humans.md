## What it does

`writing-for-humans` catches the shapes that mark prose as machine-written, in anything a person reads and judges: a post, an email, an announcement, release notes, documentation prose.

It works from a named list, not a quality bar. That is what makes it different from telling the [model](https://www.aihero.dev/ai-coding-dictionary/model) to write more naturally. "Sound less like AI" is a judgement the model has no reliable way to apply to its own output, so it answers by swapping adjectives and leaves every giveaway intact. Nine specific patterns, each with the fix attached, is something it can actually execute.

## When to reach for it

Type `/writing-for-humans`, or the [agent](https://www.aihero.dev/ai-coding-dictionary/agent) reaches for it automatically when the task is prose for a person. It is model-invoked on purpose: the tells show up in writing you never explicitly asked to be edited, so the check has to fire without you remembering it.

| What you're writing | Reach for |
|---|---|
| A post, email, announcement, docs prose, release notes | `writing-for-humans` |
| A skill, `AGENTS.md`, or a doc an agent reads by a pointer | [writing-for-agents](https://aihero.dev/skills-writing-for-agents) |
| A controlled-language technical document for a wide audience | [ste](https://aihero.dev/skills-ste) |

## The tells are shapes, not errors

Every pattern on the list is grammatical, accurate, and fine in isolation. It reads as machine output because the reader has met that exact shape a thousand times. The self-congratulating aside ("which is exactly the point") tells the reader how to feel about the sentence before it. The warm-up ("here's the thing") spends a sentence clearing its throat. The rule of three fills a shape instead of counting the reasons that exist.

This is why a normal editing pass does not remove them. Nothing in the sentence is wrong, so nothing draws the editor's eye. A named list does, because it turns "does this sound like AI?" into nine mechanical checks.

The skill drafts first and checks second, deliberately. Writing while trying to dodge nine patterns produces stilted prose. Draft, then pass over the draft once per tell.

## Common questions

**Why not just put the list in my global `CLAUDE.md`?**
Do both, and the repo supports it. A global `CLAUDE.md` is loaded into every session, so the rule is always on, but it lives on one machine and does not travel. The skill ships with the plugin, so it arrives on any machine where you install it. `scripts/bootstrap-global.sh` installs the same list to `~/.claude/forbidden.md` from the skill's own reference file, so the two can never disagree.

**Does it apply to code and commit messages?**
Not to code or code comments. It does apply to commit and PR bodies, and to user-facing strings, because those are read as writing.

## It's working if

- The draft got shorter without getting blunter, and no sentence was deleted wholesale to hit the bar.
- Lists have the number of items the argument has, which is often two or five.
- Nothing in the piece comments approvingly on the piece.
- Paragraphs open on their actual first sentence, with the throat-clearing one gone.
- The closing paragraph adds something rather than restating what you just read.

## Where it fits

A reach-for-it-anytime standalone that the agent fires on its own. Its counterpart is [writing-for-agents](https://aihero.dev/skills-writing-for-agents), which covers documents an agent consumes, where these tells do not matter and other rules do. For technical documents that need a controlled vocabulary rather than a natural voice, [ste](https://aihero.dev/skills-ste) is the stronger tool. [ask-matt](https://aihero.dev/skills-ask-matt) routes between them.
