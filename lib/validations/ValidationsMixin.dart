mixin ValidationsMixin
{
 bool checkEmptySTring(String varName)
  {
    if(varName.isEmpty)
      {
        return true;
      }
    else
      {

      return false;
      }
  }
}