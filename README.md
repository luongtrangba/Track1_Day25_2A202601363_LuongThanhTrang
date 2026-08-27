# Lab Day 25: Từ sản phẩm chạy được đến sản phẩm bán được

**Chủ đề:** AI Pricing · GTM · Evidence<br>
**Học viên:** Luong Thanh Trang<br>
**Mã học viên:** [Điền mã học viên]

## Cấu trúc repository

```text
.
├── README.md
├── Trang_Day25_model.xlsx
├── Trang_Day25_onepager.pdf
└── init_day25.sh
```

Hai file artifact hiện là placeholder và cần được thay bằng sản phẩm hoàn chỉnh:

- `Trang_Day25_model.xlsx`: mô hình định giá gồm 5 tab.
- `Trang_Day25_onepager.pdf`: Monetization One-Pager.

## Self-Evaluation Checklist

Đánh dấu `[x]` và điền bằng chứng/link trước khi nộp. Điểm tự kiểm tra tối đa: **100 điểm**.

| Đã kiểm tra | Tiêu chí / điểm | Checklist bắt buộc | Bằng chứng, số liệu hoặc link |
|---|---|---|---|
| [ ] | **1. Cost/Job Rigor (30đ)** | [ ] Tách đủ 5 thành phần chi phí: **API, Infra, HITL, Retry, Overhead**.<br>[ ] Mẫu số là **job hoàn thành**, không phải request/token.<br>[ ] Có tính **breakeven containment** và nêu rõ giả định.<br>[ ] Ghi **ngày kiểm tra giá API**. | Giá API ngày: `____`<br>Cost/job: `____`<br>Breakeven containment: `____`<br>Link/bảng tính: `____` |
| [ ] | **2. Value Metric Justification (25đ)** | [ ] Dùng ma trận **Attribution × Autonomy** để phân tích giá trị.<br>[ ] Chốt rõ **đơn vị tính tiền** (per job, per outcome, subscription...).<br>[ ] Có **2 benchmark thực tế**, mỗi benchmark có link. | Ma trận: `____`<br>Đơn vị tính tiền: `____`<br>Benchmark 1 + link: `____`<br>Benchmark 2 + link: `____` |
| [ ] | **3. Channel Evidence (20đ)** | [ ] Chốt đúng **1 kênh** go-to-market.<br>[ ] Có tính **ngân sách CAC** và nêu công thức/giả định.<br>[ ] Nếu chọn **Partner-Led**, ghi tên công ty partner cụ thể. | Kênh duy nhất: `____`<br>Ngân sách CAC: `____`<br>Công thức/giả định: `____`<br>Tên partner (nếu có): `____` |
| [ ] | **4. Pain Moment & 90-Day Plan (15đ)** | [ ] Pain Moment có đủ 3 yếu tố: **giờ + việc + app**.<br>[ ] Nêu **điểm nhúng cụ thể** trong workflow.<br>[ ] Plan 90 ngày có **số liệu mục tiêu** và **người phụ trách**. | Pain Moment (giờ / việc / app): `____`<br>Điểm nhúng: `____`<br>Ngày 1-30: `____` / Owner: `____`<br>Ngày 31-60: `____` / Owner: `____`<br>Ngày 61-90: `____` / Owner: `____` |
| [ ] | **5. Evidence Pack Readiness (10đ)** | [ ] Liệt kê đủ **3 tài sản bằng chứng**.<br>[ ] Mỗi tài sản có nội dung cụ thể **hoặc deadline rõ ràng**.<br>[ ] Các tài sản đã được liên kết/đặt tên để người chấm mở được. | 1. Tài sản: `____` / Nội dung hoặc deadline: `____`<br>2. Tài sản: `____` / Nội dung hoặc deadline: `____`<br>3. Tài sản: `____` / Nội dung hoặc deadline: `____` |

### Evidence Pack

| Tài sản | Nội dung cụ thể hoặc deadline | Vị trí/link |
|---|---|---|
| 1. Model định giá | `____` | `Trang_Day25_model.xlsx` |
| 2. Monetization One-Pager | `____` | `Trang_Day25_onepager.pdf` |
| 3. [Tên tài sản bổ sung] | `____` | `____` |

## Cách khởi tạo

Từ thư mục chứa repository, chạy:

```bash
bash init_day25.sh "Track1_Day25_[Điền_Mã_Học_Viên]_LuongThanhTrang"
```

Script sẽ tạo thư mục gốc, khởi tạo Git nếu cần, tạo README template và tạo hai file placeholder đúng tên. Nếu không truyền tên, script dùng tên repo mẫu trong yêu cầu bài Lab.