# Log chạy prompt phản biện §4.7

Ngày chạy: **27/08/2026**. Người chạy: Lương Thanh Trang (PM).

Nguyên tắc theo §4.7: AI là công cụ phản biện, không phải tác giả. Mỗi điểm AI nêu được ghi **accept / reject / partial**, và mọi sửa đổi đều tự viết lại, không chép nguyên văn.

---

## Prompt 1 — §4.7.1 Cost/Job Stress Test

Đầu vào: toàn bộ giả định Tab 1 (5.000 ca/tháng · containment 75% · Gemini 3.5 Flash-Lite · biến thể HITL B · giá bán $1,50).

| # | Điểm phản biện | Quyết định | Đã làm gì |
|---|---|---|---|
| 1 | **Thiếu chi phí thông báo "người tin cậy".** S5 Infra để 0 cho SMS/notification, trong khi tính năng người tin cậy là lõi sản phẩm và SMS mất tiền thật. | **ACCEPT** | Thêm $0,0035/ca vào `1_Cost_Job!B41` — giả định 30% ca gửi SMS × ~300 ₫. Đây là khoản bỏ sót thật, không phải bắt bẻ. |
| 2 | **Chi phí chạy eval bị ước quá thấp.** $0,0004/ca không đủ cho eval 300 ca/tháng có LLM-as-judge. | **ACCEPT** | Nâng lên $0,0016/ca (~$8/tháng). |
| 3 | **Không có chi phí trực on-call.** Hệ thống chặn dòng tiền realtime, hỏng lúc 2h sáng phải có người. | **ACCEPT** | Thêm $400/tháng (0,25 FTE kỹ sư) vào `1_Cost_Job!B59`. |
| 4 | **Không có chi phí pen test / audit tuân thủ.** Tích hợp vào ví điện tử bắt buộc kiểm định định kỳ. | **ACCEPT** | Thêm $667/tháng ($8.000/năm chia 12). |
| 5 | **Kiểm tra mẫu số.** Đang chia cho job hoàn thành hay job thử? | **ACCEPT — đã đúng sẵn** | Chia cho 3.750 job hoàn thành. Nếu chia cho 5.000 job thử thì Cost/Job chỉ $0,3470 — **thấp giả 33%**. Ghi con số này lại để trả lời khi bị hỏi. |
| 6 | **Rủi ro giá.** Giá nào là khuyến mại, tính lại ở giá list. | **ACCEPT** | Gemini 3.5 Flash-Lite không phải giá khuyến mại. Nhưng đã dựng kịch bản buộc chuyển sang Gemini 3.7 Flash giá list ($1,50/$7,50) — LLM/job tăng 3,6 lần, ghi vào `2_Pricing!A55:A58`. |
| 7 | **Con số nào sai gấp đôi thì giết mô hình.** | **ACCEPT** | Là **số phút analyst/ca escalate**, không phải giá token. 8→16 phút đẩy breakeven containment lên 81,4%, vượt 75% hiện có. Đã ghi vào One-Pager và README. |
| 8 | Đề nghị tính chi phí egress và tăng trưởng lưu trữ theo thời gian thành một dòng riêng. | **PARTIAL** | Đã gộp trong khoản audit log $0,0010/ca. Không tách riêng vì ở quy mô 5.000 ca/tháng con số quá nhỏ để đáng một dòng, nhưng ghi chú lại để rà lại khi lên 50.000 ca/tháng. |

**Tác động lên số:**

| | Trước stress | Sau stress |
|---|---|---|
| Cost/Job | $0,4564 | **$0,4626** |
| Giá sàn (3×) | $1,3691 | **$1,3879** |
| Gross Margin | 69,6% | **69,2%** |
| Breakeven containment | 69,0% | **69,3%** |
| Cost/Job có overhead | $1,0004 | **$1,2912** |
| Biên fully-loaded | 33,3% | **13,9%** |

**Điều học được, quan trọng hơn cả các con số trên:** thêm 4 khoản chi phí bị bỏ sót chỉ làm Cost/Job nhích 1,4% — vì HITL và Overhead đã chiếm 97% chi phí. Nhưng biên **fully-loaded** tụt từ 33,3% xuống 13,9%: với **một** khách, VPay gần như hoà vốn sau khi tính đủ overhead. Cần khách thứ hai để chia overhead — điều này biến mục tiêu "2 khách trả phí" ở Tháng 4+ từ tham vọng thành **điều kiện sống còn**.

---

## Prompt 2 — §4.7.5 One-Pager Defensibility Check

| # | Điểm phản biện | Quyết định | Đã làm gì |
|---|---|---|---|
| 1 | **Số yếu nhất là neo giá trị $96.000/tháng.** Ba giả định nhân nhau (5% qua ví × 25% thị phần × 30% ngăn được) — sai một cái là lệch cả chuỗi. | **ACCEPT** | Đổi từ một con số sang **dải ba kịch bản**: $30.769 / $96.154 / $246.154. Ở kịch bản thấp, giá $1,50 = 24,4% giá trị, sát mép trên dải 10–25% — vẫn bán được nhưng hết chỗ tăng giá. Đã ghi vào `2_Pricing!D10` và One-Pager. |
| 2 | **Win rate 25% là con số bịa.** | **REJECT** | Giữ nguyên. Đã kiểm: ở win rate 15% thì CAC $74.667, ở 10% thì $112.000 — **cả hai vẫn dưới ngân sách CAC $141.079**. Kết luận chọn kênh không đổi kể cả khi giả định xấu đi 2,5 lần, nên tinh chỉnh con số này không đổi được gì. |
| 3 | **Đối thủ có thể viết lại One-Pager này với số của họ không?** | **PARTIAL** | Phần Pricing và GTM thì có. Phần không sao chép được: chuỗi neo giá dựng từ số liệu Bộ Công an, phát hiện "neo nhân công thấp hơn cả giá sàn", và Pain Moment gắn với màn hình xác nhận của một app cụ thể. Đã giữ nguyên ba phần này làm chỗ khác biệt. |
| 4 | **Kiểm tra nhất quán số học** giữa Cost/Job, giá, GM và breakeven. | **ACCEPT — đã đúng** | Kiểm bằng script mô phỏng đúng công thức template. $1,50 ÷ $0,4626 = 3,24× ≥ 3 ✓. GM = (1,50−0,4626)/1,50 = 69,2% ✓. Breakeven = (v+q+e)/(P×0,4+e) = 69,3% ✓. |
| 5 | **Kênh có suy ra từ ARPU và Pain Moment không, hay quyết riêng rẽ?** | **ACCEPT — có suy ra** | Pain Moment nằm trong app ví → chỉ tới được qua hợp đồng tích hợp với chủ ví → không thể PLG. ARPU $8.500 → ACV $102.000 → 1,57 deal/AE/năm → Sales-Led khả thi về số học. |
| 6 | **Một sửa đổi làm tài liệu vững gấp 10 lần.** | **ACCEPT** | Nêu thẳng ngay trong One-Pager rằng token chỉ chiếm 1,5% chi phí và giá LLM tăng 5 lần cũng chỉ hạ GM xuống 65,6%. Câu này chặn trước phản biện phổ biến nhất với sản phẩm AI: "model rẻ đi thì ai cũng làm được, còn model đắt lên thì bạn chết". |

---

## Tổng kết

Chạy 2 prompt, nhận **9 accept · 2 partial · 1 reject**.

Thay đổi đáng kể nhất không phải Cost/Job (chỉ +1,4%) mà là hiểu đúng cấu trúc rủi ro: mô hình **miễn nhiễm với biến động giá token** nhưng **rất nhạy với thời gian con người xử lý một ca**. Điều này định lại thứ tự ưu tiên của Evidence Pack — đo containment và phút/ca analyst là việc số 1, không phải tối ưu prompt.
