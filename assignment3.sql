select city from Agents a
inner join Orders o
      on o.aid = a.aid and o.cid='c002';