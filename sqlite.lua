        local db = const.pdata
        function showrow(udata,cols,values,names)
          assert(udata=='test_udata')
          LOG('exec:')
          for i=1,cols do print('',names[i],values[i]) end
          return 0
        end
        
  function nfunc(a,b,c,d)
    return 0
    end
        
  function editpdata(uuid,sql,resultfunc)
    exists = false
    --Adds uuid data
    pcall(db:exec("INSERT INTO data (uuid) VALUES ('"..uuid.."')" ,nfunc,'test_udata'))
    for num1 in db:urows('select * from data') do LOG(num1) end
  end
  
        