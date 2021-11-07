// Basic types

type RequiredIdentifier = { id: string };

// Generics

// FIXME: use less generics, we don't really need this stuff

export type Labyrinth<ItemType> = { start: RequiredIdentifier, end: RequiredIdentifier, items: ItemType[] };
export type LabyrinthItem<DirectionForkT> = { meta: RequiredIdentifier, directions: DirectionForkT };
export type DirectedLabyrinth<DirectionForkT> = Labyrinth<LabyrinthItem<DirectionForkT>>

// Left Rigth Straight Labyrinths

export type CardinalDirectionFork<T> = { north?: T, south?: T, west?: T, east?: T };
export type CardinalLabyrinth = DirectedLabyrinth<CardinalDirectionFork<RequiredIdentifier>>;

// Demos

const demoLabyrinth: CardinalLabyrinth = {
    start: { id: 'x' },
    end: { id: 'y' },
    items: [
        { meta: { id: 'x' }, directions: { east: { id: 'y' } } },
        { meta: { id: 'y' }, directions: {} }
    ],
};

// Logic

export const representLabyrinth = (spec: CardinalLabyrinth): string => {
    // FIXME: RequiredIdentifier is a terrible type
    const idsToRooms: Record<string, RequiredIdentifier> = spec.items.reduce(
        (a, x) => ({ ...a, [x.meta.id]: x }),
        {}
    );
    const startRoomId = spec.start.id;
    const endRoomId = spec.end.id;

    // TODO: Represent the labyrinth maps!
    return '';
}

export const representRoom = (
    room: LabyrinthItem<CardinalDirectionFork<RequiredIdentifier>>,
    extras?: { isStart?: boolean, isEnd?: boolean, showRoomId?: boolean }
): string => {
    const items = {
        ending: '\n',
        corner: '+',
        space: ' ',
        entrance: { vertical: '=', horizontal: 'O' },
        wall: { vertical: '|', horizontal: '-' },
    }

    const entranceOrWall = (
        transition: any, direction: 'horizontal' | 'vertical' = 'horizontal'
    ): string => !!transition ? items.entrance[direction] : items.wall[direction]

    const centralMarking = () =>
        !!extras?.isStart ? 'S'
            : !!extras?.isEnd ? 'E'
                : !!extras?.showRoomId ? room.meta.id
                    : ' ';

    const topLine = items.corner + items.wall.horizontal.repeat(2)
        + entranceOrWall(room.directions.north, "horizontal")
        + items.wall.horizontal.repeat(2) + items.corner + items.ending;
    const bottomLine = items.corner + items.wall.horizontal.repeat(2)
        + entranceOrWall(room.directions.south, "horizontal")
        + items.wall.horizontal.repeat(2) + items.corner + items.ending;
    const spacing = items.wall.vertical
        + items.space.repeat(5)
        + items.wall.vertical + items.ending;
    const centralLine = entranceOrWall(room.directions.west, "vertical")
        + items.space.repeat(2) + centralMarking() + items.space.repeat(2)
        + entranceOrWall(room.directions.east, "vertical") + items.ending;
    return topLine + spacing + centralLine + spacing + bottomLine;
}