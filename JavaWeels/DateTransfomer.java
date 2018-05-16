
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;


/**
 * 日期转化
 *
 * @author zing
 * @create 2017-12-3 14:20:05
 */
public class DateTransfomer {
    /**
     * 获取当前时间，例如patten : YYYY-MM-dd HH:mm:ss
     *
     * @param patten
     * @return
     */
    public static String now2dateStr(String patten) {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern(patten));
    }

    /**
     * 将Date转换成字符串
     *
     * @param date   日期
     * @param patten 格式，如：YYYY-MM-dd HH:mm:ss
     * @return 转换结果
     */
    public static String date2Datestr(Date date, String patten) {
        return new SimpleDateFormat(patten).format(date);
    }

    /**
     * 字符串转换成日期
     *
     * @param date   日期字符
     * @param patten 日期字符的格式 如：YYYY-MM-dd HH:mm:ss
     * @return 日期对象
     * @throws ParseException 日期字符和日期格式不匹配
     */
    public static Date datestr2Date(String date, String patten) throws ParseException {
        return new SimpleDateFormat(patten).parse(date);
    }

    /**
     * 字符转换成java8 LocalDateTime
     *
     * @param date   日期字符串
     * @param patten 日期字符串的格式 如：YYYY-MM-dd HH:mm:ss
     * @return 转换结果
     * @throws ParseException 日期字符和日期格式不匹配
     */
    public static LocalDateTime datestr2LocalDateTime(String date, String patten) throws ParseException {
        return LocalDateTime.parse(date, DateTimeFormatter.ofPattern(patten));
    }


    /**
     * Date换成java8 LocalDateTime
     *
     * @param date 日期
     * @return 转换结果
     */
    public static LocalDateTime date2LocalDateTime(Date date) {
        return date.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
    }

    /**
     * LocalDateTime转换成Date
     *
     * @param date 日期
     * @return 转换结果
     */
    public static Date localDateTime2Date(LocalDateTime date) {
        return Date.from(date.atZone(ZoneId.systemDefault()).toInstant());
    }
}
