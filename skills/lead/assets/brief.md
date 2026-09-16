# <Step N>: <title>, brief for the worker

<Two to five sentences: what this step is, why it exists now, what it unblocks.
A term the worker may not know gets defined in three lines before it is used.>

## Orientation

<What a fresh session must read before touching anything, as paths with a phrase
each on why: the files it will change and their neighbours, the spec or design
pages the change answers to, the earlier step this builds on, the example to
copy the shape of. Anything that is evidence and must stay as it is, say so
here.>

## Write scope

<The exact paths the worker may create or change. Anything outside is off
limits, including the record. Branch `<name>`, one commit per part with
`<Step N> part X` in the subject, push after every commit, `<test command>`
green at every commit.>

## Part A: <name>

<Numbered items, each checkable. State the rule or behaviour in the words you
want in the report and in any spec line the worker writes.>

## Part B: <name>

<...>

## Numbers

<What is measured, how (best of five, which modes, which sizes), and the table
to fill, with a "before" column where a baseline exists.>

## Done when

<Every part landed and pushed, the test command green, the numbers table filled,
and the report at `REPORT-<step>.md` at the repo root (also printed in the pane)
with the numbers and a numbered list "Decisions the brief did not cover". Each
item here is something the lead can check.>
