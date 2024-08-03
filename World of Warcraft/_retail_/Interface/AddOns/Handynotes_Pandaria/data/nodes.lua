local _, addon = ...;

local MAP_IDS = {
  jadeforest = 371,
  valleyoffourwinds = 376,
  kunlai = 379,
  townlong = 388,
  valeofblossoms = 390,
  krasarang = 418,
  dreadwastes = 422,
  veiledstar = 433,
  isleofthunder = 504,
  isleofgiants = 507,
  timelessisle = 554,
};

local nodeData = {
  [MAP_IDS.isleofgiants] = {
    rares = {
      [50605440] = 69161,
    },
  },
  [MAP_IDS.timelessisle] = {
    rares = {
      [65605680] = 73167,
      [64602860] = 73282,
      [44203100] = 73157,
      [33808580] = 72193,
      [70805260] = 73171,
      [43806960] = 73854,
      [66004260] = 73171,
      [35003240] = 72898,
      [56005960] = 72896,
      [57602640] = 72898,
      [31004920] = 73158,
      [34802940] = 72898,
      [50602340] = 72898,
      [54002400] = 72896,
      [41603020] = 72896,
      [63807300] = 72775,
      [62804360] = 73171,
      [47608780] = 72245,
      [67604400] = 73277,
      [46603960] = 73172,
      [35603620] = 72896,
      [72808480] = 73279,
      [55803560] = 72898,
      [59605280] = 73171,
      [61606400] = 72970,
      [25802320] = 73281,
      [44803880] = 72769,
      [71408140] = 73704,
      [56003820] = 72896,
      [50202290] = 73666,
      [22803240] = 73166,
      [40607960] = 72909,
      [37807720] = 71919,
      [57607720] = 73170,
      [54005240] = 73175,
      [54204280] = 72808,
      [59004880] = 71864,
      [60608780] = 72048,
      [68005740] = 73171,
      [45002600] = 72898,
      [68803440] = 72896,
      [70604580] = 73171,
      [24605760] = 73161,
      [44202660] = 73173,
      [34207340] = 73163,
      [49603360] = 72898,
      [34803120] = 73174,
      [29804560] = 73160,
      [25203600] = 72045,
      [53608300] = 73169,
    },
    treasures = {
      [47308080] = {222796, 223539, 223537, 223538},
      [55305030] = {222796, 223539, 223537, 223538},
      [63104530] = {222796, 223539, 223537, 223538},
      [55605930] = {222796, 223539, 223537, 223538},
      [50407170] = {222796, 223539, 223537, 223538},
      [68406040] = {222796, 223539, 223537, 223538},
      [42805540] = {222796, 223539, 223537, 223538},
      [48005120] = {222796, 223539, 223537, 223538},
      [25007190] = {222796, 223539, 223537, 223538},
      [64507230] = {222796, 223539, 223537, 223538},
      [55107290] = {222796, 223539, 223537, 223538},
      [33805450] = {222796, 223539, 223537, 223538},
      [37704110] = {222796, 223539, 223537, 223538},
      [39607780] = {222796, 223539, 223537, 223538},
      [65405170] = {222796, 223539, 223537, 223538},
      [52206260] = {222796, 223539, 223537, 223538},
      [32006150] = {222796, 223539, 223537, 223538},
      [32603280] = {222796, 223539, 223537, 223538},
      [22403870] = {222796, 223539, 223537, 223538},
      [49706950] = 220901,
      [53904710] = 220902,
      [59006000] = 220908,
      [40409230] = 220832,
      [22505890] = 220986,
      [70708090] = 221036,
    },
  },
  [MAP_IDS.isleofthunder] = {
    rares = {
      [60503730] = 69099,
      [55208770] = 69341,
      [48202560] = 70001,
      [49902070] = 69347,
      [61604980] = 69999,
      [68903930] = 70080,
      [35006200] = 69664,
      [39608120] = 50358,
      [51007120] = 69997,
      [44506100] = 69339,
      [55304790] = 69767,
      [44602960] = 70000,
      [63404900] = 70003,
      [54403580] = 70002,
      [35706380] = 69471,
      [57907920] = 69396,
      [37608300] = 69996,
      [30705860] = 69633,
      [48002600] = 69749,
      [53705310] = 69998,
    }
  },
  [MAP_IDS.jadeforest] = {
    rares = {
      [39606260] = 50363,
      [53604960] = 51078,
      [48202060] = 50350,
      [52204440] = 51078,
      [54204240] = 51078,
      [42603880] = 50823,
      [53804560] = 51078,
      [46601680] = 50350,
      [57407140] = 50808,
      [42601620] = 50350,
      [56404880] = 51078,
      [64607420] = 50782,
      [44007500] = 50338,
      [33605080] = 50750,
      [42201760] = 50350,
      [40801520] = 50350,
      [48001860] = 50350,
      [44401760] = 69768,
      [53002300] = 69768,
      [53003120] = 69768,
      [52601900] = 69769,
    },
    treasures = {
      [26203240] = 31400,
      [31902780] = 31401,
      [23503500] = 31404,
      [50709990] = 31396,
      [24605320] = 31864,
      [46308070] = 31865,
      [62402750] = 31866,
    },
  },
  [MAP_IDS.krasarang] = {
    rares = {
      [10405710] = 68322,
      [52208800] = 50830,
      [87402920] = 68319,
      [67202300] = 50352,
      [31103460] = 50768,
      [39602900] = 50331,
      [85002760] = 68318,
      [12406470] = 68320,
      [13405480] = 68321,
      [58604390] = 50787,
      [53603880] = 50340,
      [84603100] = 68317,
      [40505290] = 50816,
      [42805290] = 50816,
      [15203560] = 50388,
      [36205900] = 69768,
      [39406340] = 69768,
      [43805700] = 69768,
      [38806730] = 69769,
    },
    treasures = {
      [68600760] = 31408,
      [52167342] = 31863,
    },
  },
  [MAP_IDS.valeofblossoms] = {
    rares = {
      [14005820] = 50749,
      [16804040] = 64403,
      [36805780] = 50806,
      [69603080] = 50780,
      [39802500] = 50359,
      [15003560] = 50349,
      [43805180] = 50806,
      [51404300] = 64403,
      [87804460] = 50336,
      [31009160] = 50840,
      [14005860] = 50749,
      [39005340] = 50806,
      [38806560] = 64403,
      [42606900] = 50822,
      [43405340] = 50806,
      [35206180] = 50806,
    },
  },
  [MAP_IDS.valleyoffourwinds] = {
    rares = {
      [71606440] = 62346,
      [52802860] = 50766,
      [59003860] = 50766,
      [71005240] = 50783,
      [37806060] = 51059,
      [54603660] = 50766,
      [19003580] = 50828,
      [18607760] = 50351,
      [15603200] = 50828,
      [32806280] = 51059,
      [88601800] = 50811,
      [75804640] = 50783,
      [74605180] = 50783,
      [8205960] = 50364,
      [9204740] = 50364,
      [57603380] = 50766,
      [54003160] = 50766,
      [37002560] = 50339,
      [14003820] = 50828,
      [16803520] = 50828,
      [34605960] = 51059,
      [12604880] = 50364,
      [67605960] = 50783,
      [39605760] = 51059,
      [9206060] = 50364,
      [16604100] = 50828,
    },
    treasures = {
      [23802850] = 31405,
      [92003900] = 31869,
    },
  },
  [MAP_IDS.dreadwastes] = {
    rares = {
      [64205860] = 50776,
      [36606460] = 50805,
      [35603080] = 50739,
      [71803760] = 50347,
      [55406340] = 50836,
      [25202860] = 50334,
      [73202040] = 50356,
      [36806060] = 50805,
      [73002220] = 50356,
      [39606180] = 50805,
      [73602360] = 50356,
      [34802320] = 50821,
      [39204180] = 50739,
      [74002080] = 50356,
      [39605840] = 50805,
      [37802960] = 50739,
      [39604920] = 69768,
      [47806040] = 69768,
      [59806640] = 69768,
      [47206160] = 69769,
    },
  },
  [MAP_IDS.kunlai] = {
    rares = {
      [54206330] = 60491,
      [36607960] = 50733,
      [44806360] = 50831,
      [59207380] = 50354,
      [73207640] = 50769,
      [40804240] = 50817,
      [47408120] = 50332,
      [57007580] = 50354,
      [63801380] = 50789,
      [51608100] = 50332,
      [56004340] = 50341,
      [74407920] = 50769,
      [73807740] = 50769,
      [46206180] = 50831,
      [47206300] = 50831,
      [44806520] = 50831,
      [57607500] = 50354,
      [65206460] = 69768,
      [74606600] = 69768,
      [67407960] = 69768,
      [75006760] = 69769,
    },
    treasures = {
      [64204520] = 31420,
      [49505940] = 31414,
      [36707980] = 31418,
      [52605150] = 31419,
      [72003390] = 31416,
      [59505290] = 31415,
      [57807630] = 31422,
      [47807350] = 31868,
    },
  },
  [MAP_IDS.townlong] = {
    rares = {
      [66408680] = 50772,
      [67808760] = 50772,
      [64204980] = 50333,
      [67607440] = 50832,
      [68808920] = 50772,
      [67805080] = 50333,
      [32006180] = 50820,
      [42007840] = 50734,
      [63003560] = 50355,
      [46407440] = 50734,
      [37205760] = 66900,
      [47608420] = 50734,
      [59208560] = 50791,
      [66804440] = 50333,
      [54006340] = 50344,
      [65408760] = 50772,
      [47808860] = 50734,
      [47408760] = 69768,
      [39808900] = 69768,
      [40407860] = 69768,
      [48607420] = 69768,
      [36608560] = 69769,
    },
    treasures = {
      [62803410] = 31427,
      [65808610] = 31426,
      [34906310] = 31423,
      [53905840] = 31424,
      [57505850] = 31424,
    },
  },
  [MAP_IDS.veiledstar] = {
    treasures = {
      [75107640] = 31428,
      [54607260] = 31867,
    },
  },
}

addon.nodeData = (function ()
  local TYPE_RARE = 'rare';
  local TYPE_TREASURE = 'treasure';
  local data = {};

  local function addNode (mapId, coords, type, id)
    local mapData = data[mapId];

    if (mapData[coords] == nil) then
      mapData[coords] = {};
    elseif (mapData[coords][type] ~= nil) then
      print('Node conflict. Map:', mapId, 'coords:', coords, 'type:', type);
    end

    mapData[coords][type] = id;
  end

  for mapId, nodes in pairs(nodeData) do
    data[mapId] = {};

    if (nodes.rares) then
      for coords, rareId in pairs(nodes.rares) do
        addNode(mapId, coords, TYPE_RARE, rareId);
      end
    end

    if (nodes.treasures) then
      for coords, treasureId in pairs(nodes.treasures) do
        addNode(mapId, coords, TYPE_TREASURE, treasureId);
      end
    end
  end

  nodeData = nil;

  return data;
end)();