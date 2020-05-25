SELECT SUM(gweight), SUM(pweight), SUM(nweight)
FROM ((goods JOIN forms ON goods.form = forms.no)
JOIN `calendar days` ON `calendar days`.concat = forms.date)
WHERE
forms.client = '1234567890' AND
`calendar days`.m = 11 AND
`calendar days`.y = 1398
GROUP BY goods.description

SELECT qty AS "مقدار", gweight AS "وزن ناخالص", nweight AS "وزن خالص"
FROM ((goods JOIN forms ON goods.form = forms.no)
JOIN `calendar days` ON `calendar days`.concat = forms.date)
WHERE
description = 'خامه' AND
forms.client = '1234567890' AND
`calendar days`.m = 11 AND
`calendar days`.y = 1398
UNION ALL
SELECT SUM(qty) AS "مقدار", SUM(gweight) AS "وزن ناخالص", SUM(nweight) AS "وزن خالص"
FROM ((goods JOIN forms ON goods.form = forms.no)
JOIN `calendar days` ON `calendar days`.concat = forms.date)
WHERE
description = 'خامه' AND
forms.client = '1234567890' AND
`calendar days`.m = 11 AND
`calendar days`.y = 1398

SELECT description AS "عنوان", SUM(gweight) AS "وزن ناخالص", SUM(nweight) AS "وزن خالص"
FROM ((goods JOIN forms ON goods.form = forms.no)
JOIN `calendar days` ON `calendar days`.concat = forms.date)
WHERE
forms.client = '1234567890' AND
`calendar days`.m = 11 AND
`calendar days`.y = 1398
GROUP BY goods.description

SELECT gweight, pweight, nweight
FROM ((goods JOIN forms ON goods.form = forms.no)
JOIN `calendar days` ON `calendar days`.concat = forms.date)
WHERE
forms.client = '1234567890' AND
`calendar days`.m = 11 AND
`calendar days`.y = 1398

SELECT gweight, pweight, nweight
FROM goods JOIN forms ON goods.form = forms.no
WHERE
forms.client = '1234567890'
