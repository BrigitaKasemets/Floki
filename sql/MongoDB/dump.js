// Plants collection
db.plant.insertMany([
    {
        _id: "1",
        species: "aloe vera",
        name: "alo",
        date_added: new Date("2020-01-01"),
        location: "living room"
    },
    {
        _id: "2",
        species: "cactus",
        name: "cac",
        date_added: new Date("2023-12-06"),
        location: "living room"
    },
    {
        _id: "3",
        species: "bamboo",
        name: "bam",
        date_added: new Date("2020-11-11"),
        location: "bedroom"
    },
    {
        _id: "4",
        species: "cactus",
        name: "smelly",
        date_added: new Date("2021-07-12"),
        location: "living room"
    },
    {
        _id: "5",
        species: "aloe vera",
        name: "boo",
        date_added: new Date("2023-09-11"),
        location: "bedroom"
    }
])

// Watering collection
db.watering.insertMany([
    {
        _id: "1",
        plant_id: "1",
        date: new Date("2025-01-01"),
        amount: 100
    },
    {
        _id: "2",
        plant_id: "2",
        date: new Date("2024-12-26"),
        amount: 50
    },
    {
        _id: "3",
        plant_id: "3",
        date: new Date("2025-01-03"),
        amount: 200
    },
    {
        _id: "4",
        plant_id: "4",
        date: new Date("2024-12-26"),
        amount: 100
    },
    {
        _id: "5",
        plant_id: "5",
        date: new Date("2025-01-05"),
        amount: 150
    }
])

// Fertilizing collection
db.fertilizing.insertMany([
    {
        _id: "1",
        plant_id: "1",
        watering_id: "1",
        date: new Date("2025-01-01"),
        type: "organic"
    },
    {
        _id: "2",
        plant_id: "2",
        watering_id: "2",
        date: new Date("2024-12-26"),
        type: "organic"
    },
    {
        _id: "3",
        plant_id: "3",
        watering_id: "3",
        date: new Date("2025-01-03"),
        type: "chemical"
    },
    {
        _id: "4",
        plant_id: "4",
        watering_id: "4",
        date: new Date("2024-12-26"),
        type: "organic"
    },
    {
        _id: "5",
        plant_id: "5",
        watering_id: "5",
        date: new Date("2025-01-05"),
        type: "chemical"
    }
])

// Näidispäringud, mida sa kasutasid
// 1. Kõik elutoa taimed
db.plant.find({ location: "living room" })

// 2. Taimed magamistoas, mida on kastetud rohkem kui 160ml
db.plant.aggregate([
    {
        $lookup: {
            from: "watering",
            localField: "_id",
            foreignField: "plant_id",
            as: "watering_info"
        }
    },
    {
        $match: {
            location: "bedroom",
            "watering_info.amount": { $gt: 160 }
        }
    },
    {
        $project: {
            name: 1,
            location: 1,
            "watering_info.amount": 1
        }
    }
])