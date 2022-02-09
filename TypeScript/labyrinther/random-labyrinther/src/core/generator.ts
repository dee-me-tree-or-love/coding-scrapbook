type IndexedData<T> = { index: T };
type Point = { x: number, y: number };
type PointTag = string;
type CardinalExits = { north: boolean, west: boolean, east: boolean, south: boolean };
type RoomVarieties = "start" | "end" | "basic";
type Room<ExitType> = IndexedData<Point> & { exits: ExitType, variety: RoomVarieties };
type CardinalRoom = Room<CardinalExits>;
type Corridor<ExitType> = { start: Room<ExitType>, end: Room<ExitType> };
type CardinalCorridor = Corridor<CardinalExits>;
type PointRecord<T> = Record<PointTag, T>;
type Labyrinth = { rooms: PointRecord<CardinalRoom>, width: number, height: number };

const buildRoom = (exits: CardinalExits, variety: RoomVarieties, index: Point): CardinalRoom => {
    return {
        index,
        exits,
        variety
    }
}

const buildBasicClosedRoom = (index: Point): CardinalRoom => {
    return {
        index,
        exits: { north: false, east: false, south: false, west: false },
        variety: "basic"
    };
}

const connectExits = (origin: Partial<CardinalExits>): CardinalExits => {
    return {
        north: !!origin.south,
        east: !!origin.west,
        west: !!origin.east,
        south: !!origin.north,
    }
}

const enableRandomExits = (origin: CardinalExits): CardinalExits => {
    const randomToggledExits = Object.entries(origin)
        .filter(([_, value]) => value === false)
        .reduce(
            (accumulator, [key, value]) => ({
                ...accumulator,
                [key]: Math.random() < 0.5
            }),
            {} as CardinalExits
        )
    return {
        ...origin,
        ...randomToggledExits
    }
}

const buildRandomCorridor = (startRoom: CardinalRoom, targetRoomIndex: Point): CardinalCorridor => {
    const connectedExists = connectExits(startRoom.exits);
    const randomExits = enableRandomExits(connectedExists);
    const newRoom = buildRoom(randomExits, "basic", targetRoomIndex)
    return { start: startRoom, end: newRoom }
}

const changeRoomVariety = (room: CardinalRoom, newVariety: RoomVarieties): CardinalRoom => {
    return { ...room, variety: newVariety };
}

const changeRoomToStart = (room: CardinalRoom): CardinalRoom => {
    return changeRoomVariety(room, "start");
}

const changeRoomToEnd = (room: CardinalRoom): CardinalRoom => {
    return changeRoomVariety(room, "end");
}

const getTag = (point: Point): PointTag => {
    return `${point.x}_${point.y}`;
}

const buildLabyrinthBase = (width: number, height: number): Labyrinth => {
    let rooms: PointRecord<CardinalRoom> = {};
    for (let x = 0; x < width; x++) {
        for (let y = 0; y < height; y++) {
            const point = { x, y };
            rooms[getTag(point)] = buildBasicClosedRoom(point);
        }
    }
    return { rooms, width, height };
}

const getRoomNeighbours = (room: CardinalRoom, labyrinth: Labyrinth): CardinalRoom[] => {
    const roomX = room.index.x;
    const roomY = room.index.y;
    const rooms = labyrinth.rooms;

    return [
        ...(roomX - 1 > 0 ? [rooms[getTag({ x: roomX - 1, y: roomY })]] : []),
        ...(roomY - 1 > 0 ? [rooms[getTag({ x: roomX, y: roomY - 1 })]] : []),
        ...(roomX + 1 < labyrinth.width ? [rooms[getTag({ x: roomX + 1, y: roomY })]] : []),
        ...(roomY + 1 < labyrinth.height ? [rooms[getTag({ x: roomX, y: roomY + 1 })]] : []),
    ]
}

const makeRandomPath = (
    labyrinth: Labyrinth,
    visitedRooms: PointRecord<boolean>,
    startRoom: CardinalRoom
) => {
    const neighbours = getRoomNeighbours(startRoom, labyrinth);

}

export const generateRandomLabyrinth = (width: number, height: number): Corridor[] => {
    const labyrinth = buildLabyrinthBase(width, height);
    const startPoint = { x: 0, y: 0 };
    const startRoom = labyrinth.rooms[getTag(startPoint)];
    const visitedRooms: PointRecord<boolean> = { [getTag(startPoint)]: true };

    return rooms;
}
