# Labyrinther

Construct random labyrinth structures in JSON form to be used as maps for
text-based adventures (and not only?).

## Services

- [Random-labyrithner](#random-labyrinther)
- [ASCII-labyrinther](#ascii-labyrinther)

---

### [Random-labyrinther](#services)

Creates random labyrinths.

#### Receives

```json
// TODO: describe labyritnh recipe format
```

#### Produces

```json
// TODO: describe a labyrinth json format
```

---

### [ASCII labyrinther](#services)

Displays labyrinth descriptions in ASCII form.

#### Receives

```json
// TODO: describe a labyrinth json format
```

#### Produces

```plaintext
+---------------------------------------+----+----+
|                                       |::::|    |
|    +-----------------------------+    |::::|    |
|    |                             |    |::::|    |
|    |    +-------------------+    |    |::::|    |
|    |    |                   |    |    |::::|    |
|    |    +----     +----     |    |    |::::|    |
|    |              | X       |    |    |::::|    |
|    |    +---------+---------+    |    +----+    |
|    |    |                   |    |              |
|    +----+    +---------+    |    +---------+----|
|         |    |         |    |              |::::|
|    +    |    |    +    |    |    +---------+::::|
|    |    |    |    |    |    |    |::::::::::::::|
+----+    |    |    |    |    |    +--------------+
|         |    |    |    |    |    |              |
|    +----+    +----+    |    |    |     ----+    |
|    |::::|              |    |    |         |    |
|    +----+---------     |    |    +---------+    |
|                        |    |                   |
+------------------------+    +-------------------+
```

---