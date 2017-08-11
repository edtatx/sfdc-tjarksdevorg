public class ParkLocator {
    public  static string[] country(String country) {
        ParkService.ParksImplPort prk = new ParkService.ParksImplPort();
        return prk.byCountry(country);
    }
}